# To setup

```
git clone https://github.com/kowshikdiamond/EFKstack-setup-using-dockercompose.git efk-stack
```

```
cd efk-stack
```

```
docker compose -f docker-compose.yml up -d
```

## To test the logs
```
cd test_application
```

```
docker compose -f docker-compose.yml up -d
```

## Manual Commands to create certs 

```
mkdir -p certs
```

```
docker run --rm -it -v "$(pwd)/certs:/certs" docker.elastic.co/elasticsearch/elasticsearch:8.14.0 bin/elasticsearch-certutil ca --pem --out /certs/elastic-stack-ca.zip
```

```
unzip certs/elastic-stack-ca.zip -d certs
```

```
nano certs/instances.yml
```

```
instances:
  - name: "elasticsearch"
    dns: [ "elasticsearch", "localhost" ]
  - name: "kibana"
    dns: [ "kibana", "localhost" ]
```

```
docker run --rm -it -v "$(pwd)/certs:/certs" docker.elastic.co/elasticsearch/elasticsearch:8.14.0 bin/elasticsearch-certutil cert --pem --in /certs/instances.yml --out /certs/elastic-certificates.zip --ca-cert /certs/ca/ca.crt --ca-key /certs/ca/ca.key
```

```
unzip certs/elastic-certificates.zip -d certs
```
