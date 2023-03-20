FROM maven:3.8 AS maven

WORKDIR /usr/src/app/

COPY ./app /usr/src/app/

RUN mvn package 

## Multi step docker for mac m1
## FROM openjdk:20-jdk
FROM --platform=linux/arm64 arm64v8/openjdk

ARG JAR_FILE=letscodebyada-0.0.1-SNAPSHOT.jar
WORKDIR /opt/app
COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","letscodebyada-0.0.1-SNAPSHOT.jar"]