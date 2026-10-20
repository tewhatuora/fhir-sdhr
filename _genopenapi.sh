CONVERTER_DL_URL=$(curl -s https://api.github.com/repos/tewhatuora/fhir-openapi-converter/releases/latest | jq -r '.assets[] | select(.name == "cli.js") | .browser_download_url')
curl -L -o fhir-openapi-converter.js $CONVERTER_DL_URL

SCHEMA_CACHE_DIR="$PWD/.oas-schema-cache/alt-fhir-oas-flattened"
SCHEMA_SERVER_ROOT="$PWD/.oas-schema-cache"
SCHEMA_SERVER_PORT=38123
mkdir -p "$SCHEMA_CACHE_DIR"

if [ ! -f "$SCHEMA_CACHE_DIR/Bundle-definition.json" ]; then
	curl -s https://api.github.com/repos/tewhatuora/schemas/contents/alt-fhir-oas-flattened \
		| jq -r '.[] | select(.type == "file") | [.download_url, .name] | @tsv' \
		| while IFS=$'\t' read -r download_url file_name; do
			curl -L --silent "$download_url" -o "$SCHEMA_CACHE_DIR/$file_name"
		done
fi

if [ ! -f "$SCHEMA_CACHE_DIR/Parameters-definition.json" ]; then
	cat <<'EOF' > "$SCHEMA_CACHE_DIR/Parameters-definition.json"
{
	"type": "object",
	"properties": {
		"resourceType": {
			"type": "string",
			"enum": ["Parameters"]
		},
		"id": {
			"type": "string",
			"pattern": "[A-Za-z0-9\\-\\.]{1,64}"
		},
		"meta": {
			"type": "object",
			"additionalProperties": true
		},
		"implicitRules": {
			"type": "string",
			"pattern": "\\S*"
		},
		"language": {
			"type": "string",
			"pattern": "[^\\s]+(\\s[^\\s]+)*"
		},
		"parameter": {
			"type": "array",
			"items": {
				"type": "object",
				"additionalProperties": true,
				"properties": {
					"name": {
						"type": "string"
					},
					"part": {
						"type": "array",
						"items": {
							"type": "object",
							"additionalProperties": true
						}
					},
					"resource": {
						"type": "object",
						"additionalProperties": true
					}
				}
			}
		}
	},
	"additionalProperties": true
}
EOF
fi

python3 -m http.server "$SCHEMA_SERVER_PORT" --bind 127.0.0.1 --directory "$SCHEMA_SERVER_ROOT" >/tmp/oas-schema-server.log 2>&1 &
SCHEMA_SERVER_PID=$!
trap 'kill "$SCHEMA_SERVER_PID" >/dev/null 2>&1' EXIT

for _ in 1 2 3 4 5; do
	if curl --silent --output /dev/null "http://127.0.0.1:${SCHEMA_SERVER_PORT}/alt-fhir-oas-flattened/Bundle-definition.json"; then
		break
	fi
	sleep 1
done

perl -0pi -e 's#https://raw\.githubusercontent\.com/tewhatuora/schemas/main/alt-fhir-oas-flattened/#http://127.0.0.1:38123/alt-fhir-oas-flattened/#g' fhir-openapi-converter.js

CAPABILITY_STATEMENT_JSON="fsh-generated/resources/CapabilityStatement-SDHRCapabilityStatement.json"
if [ -f "$CAPABILITY_STATEMENT_JSON" ]; then
	jq '(.rest[]?.resource[]? | select(has("operation") and (has("interaction") | not)) | .interaction) = []' "$CAPABILITY_STATEMENT_JSON" > "${CAPABILITY_STATEMENT_JSON}.tmp" \
		&& mv "${CAPABILITY_STATEMENT_JSON}.tmp" "$CAPABILITY_STATEMENT_JSON"
fi

LOG_LEVEL=debug node ./fhir-openapi-converter.js --inputFolder fsh-generated --outputFolder oas
result=$?

if [ $result -ne 0 ]; then
	echo "Error generating OpenAPI specification. Exiting."
	exit $result
fi

oas_replace='SharedCareFHIRAPICapabilityStatement.openapi'
yaml_file=$(echo oas/*.yaml)
echo "Copying OpenAPI specification to output/${oas_replace}.yaml"
cp $yaml_file output/${oas_replace}.yaml

json_file=$(echo oas/*.json)
echo "Copying OpenAPI specification to output/${oas_replace}.json"
cp $json_file output/${oas_replace}.json
