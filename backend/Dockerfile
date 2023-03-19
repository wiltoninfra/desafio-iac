FROM maven:3.8 AS maven

ARG MYSQL_DB_HOST
ARG MYSQL_DB_USER
ARG MYSQL_DB_PASS

WORKDIR /usr/src/app/
COPY ./app /usr/src/app/

RUN mvn package 

## Multi step docker 
FROM --platform=linux/arm64 arm64v8/openjdk

ARG JAR_FILE=letscodebyada-0.0.1-SNAPSHOT.jar

WORKDIR /opt/app

COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

EXPOSE 8080

ENTRYPOINT ["java","-jar","letscodebyada-0.0.1-SNAPSHOT.jar"]