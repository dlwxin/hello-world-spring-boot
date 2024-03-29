FROM bellsoft/liberica-openjdk-alpine:17
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java","-jar","app.jar"]
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
