# hello-world-spring-boot

A simple Spring Boot demo

## Getting Started

```shell
curl http://localhost:8080/api/hash

curl http://localhost:8080/api/

curl http://localhost:8080/api/path?path=/assets/test

curl http://localhost:8080/config
```

## Run in container

```shell
mvn clean package
docker build -t hello-world-spring-boot .
```

```shell
docker run --name hello-world-spring-boot -p 8080:8080 -d hello-world-spring-boot
```

## Run in kubernetes

```shell
kubectl apply -f deploy/k8s/deployment.yaml
POD_NAME=$(kubectl get po | grep deployment-simple-spring-boot | awk '{print $1}')
kubectl exec -it $POD_NAME -- sh
```
