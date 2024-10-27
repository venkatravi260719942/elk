## Create data directory for Elasticsearch

```
mkdir elasticsearch/data
```

## Before Run the docker-compose command

```
chmod go-w ./filebeat/filebeat.yml
sudo chown -R 1000:1000 ./elasticsearch/data
```

## Run

```
docker-compose up -d --build
```

## Once the everything got spinedup follow the below steps

```
docker exec -it fb filebeat setup --template --dashboards
curl -X GET "http://localhost:9200/_cat/indices?v"
```

Check the filebeat index is presented or not.


## Refresh Kibana Index Patterns
Go to Kibana > Stack Management > Index Patterns.
Create or refresh an index pattern for filebeat-*.
Verify if Filebeat data appears in Discover after this refresh.


## Down all

```
docker-compose down -v
```