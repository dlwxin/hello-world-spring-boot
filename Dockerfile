FROM amazoncorretto:17-al2023

ARG APP_HOME=/app
WORKDIR ${APP_HOME}
VOLUME /tmp

# Define original and new users
ARG USERNAME=appuser
ARG USER_UID=1001
ARG GROUP_NAME=appuser
ARG GROUP_GID=1001

# Additional users
ARG USER2_NAME=devuser
ARG USER2_UID=1002
ARG USER3_NAME=supportuser
ARG USER3_UID=1003

# Create group and users
RUN yum install -y shadow-utils \
    && groupadd -g ${GROUP_GID} ${GROUP_NAME} \
    && useradd -u ${USER_UID} -g ${GROUP_GID} ${USERNAME} \
    && useradd -u ${USER2_UID} -g ${GROUP_GID} ${USER2_NAME} \
    && useradd -u ${USER3_UID} -g ${GROUP_GID} ${USER3_NAME} \
    && chown -R :${GROUP_NAME} ${APP_HOME} \
    && chmod -R 755 ${APP_HOME} \
    && yum remove -y shadow-utils \
    && yum clean all \
    && rm -rf /var/cache/yum

USER ${USERNAME}

ARG JAR_FILE=target/*.jar
ARG APP_FILE=app.jar
COPY --chown=:${GROUP_NAME} ${JAR_FILE} ${APP_FILE}

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar ${0} ${@}"]
