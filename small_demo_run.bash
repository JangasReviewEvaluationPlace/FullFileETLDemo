docker-compose -f docker-compose.database.yml up -d

docker-compose -f docker-compose.kafka.yml up -d

until $(curl --output /dev/null --silent --head --fail http://localhost:8083/connectors); do
    echo "Connect not available. Wait 5s - it might take some time"
    sleep 5
done

echo "Connect available - let's go!"

docker-compose -f docker-compose.file-etl-small.yml up -d sftp
docker-compose -f docker-compose.file-etl-small.yml up etl

echo "Creating Connectors"

curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'connect/connector_properties/postgres_sink.json')"

curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'connect/connector_properties/openssh_source.json')"
