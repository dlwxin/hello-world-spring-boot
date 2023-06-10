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
docker build -t hello-world-spring-boot .
```

```shell
docker run --name hello-world-spring-boot -d hello-world-spring-boot
```
