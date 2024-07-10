FROM amazoncorretto:17-al2023

ARG APP_HOME=/app
WORKDIR ${APP_HOME}
VOLUME /tmp

ARG USERNAME=appuser
ARG USER_UID=1001
ARG GROUP_NAME=appuser
ARG GROUP_GID=1001

RUN yum install -y shadow-utils \
    && groupadd -g ${GROUP_GID} ${GROUP_NAME} \
    && useradd -u ${USER_UID} -g ${GROUP_GID} ${USERNAME} \
    && chown -R ${USERNAME}:${GROUP_NAME} ${APP_HOME} \
    && chmod -R 755 ${APP_HOME} \
    && yum remove -y shadow-utils \
    && yum clean all \
    && rm -rf /var/cache/yum

USER ${USERNAME}

ARG JAR_FILE=target/*.jar
ARG APP_FILE=app.jar
COPY --chown=${USERNAME}:${GROUP_NAME} ${JAR_FILE} ${APP_FILE}

# ENTRYPOINT ["java", "-jar", "app.jar"]
# CMD ["${JAVA_OPTS}"]
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${0} ${@}"]
