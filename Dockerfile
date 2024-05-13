FROM amazoncorretto:17-al2023
WORKDIR /app
VOLUME /tmp
RUN yum install -y shadow-utils \
    && groupadd -r appuser \
    && useradd -r -u 1000 -g appuser appuser \
    && chown -R appuser:appuser /app \
    && chmod -R 755 /app \
    && yum remove -y shadow-utils \
    && rm -rf /var/cache/yum
USER appuser
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${0} ${@}"]
