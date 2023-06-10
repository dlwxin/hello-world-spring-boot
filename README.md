# hello-world-spring-boot

A simple Spring Boot demo

## Getting Started

```shell
curl http://localhost:8080/api/hash

curl http://localhost:8080/api/

curl http://localhost:8080/config
```

## Run in the container

```shell
mvn clean package
docker build -t hello-world-spring-boot .
```

```shell
docker run --name hello-world-spring-boot -p 8080:8080 -d hello-world-spring-boot
```
