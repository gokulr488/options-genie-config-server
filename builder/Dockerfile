FROM eclipse-temurin:21-jdk-alpine

RUN apk add --no-cache bash procps curl tar
RUN apk add git
RUN apk add openssh-client
RUN apk add sshpass

# common for all images
ENV MAVEN_HOME /usr/share/maven

COPY --from=maven:3.9.6-eclipse-temurin-11 ${MAVEN_HOME} ${MAVEN_HOME}
COPY --from=maven:3.9.6-eclipse-temurin-11 /usr/local/bin/mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY --from=maven:3.9.6-eclipse-temurin-11 /usr/share/maven/ref/settings-docker.xml /usr/share/maven/ref/settings-docker.xml

RUN ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

ARG MAVEN_VERSION=3.9.6
ARG USER_HOME_DIR="/root"
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# Make ssh dir
#RUN mkdir -p /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN mkdir /home/workspace/
# Set the working directory inside the container
WORKDIR /home/workspace

# Create a volume for Maven repository
VOLUME /root/.m2/repository

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
COPY builderscript.sh builderscript.sh
CMD ["./builderscript.sh"]

#NOTES
#command to run docker
#sudo docker run -it -v $SSH_AUTH_SOCK:/ssh-agent -v maven_repository:/root/.m2/repository -e SSH_AUTH_SOCK=/ssh-agent og_app_builder:latest
#for intellij config, echo $SSH_AUTH_SOCK  use the value of this, as the volume mount key