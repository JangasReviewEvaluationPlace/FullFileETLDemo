curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'./connector_properties/postgres_sink.json')"

curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'./connector_properties/openssh_source.json')"
