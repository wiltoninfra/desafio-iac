FROM maven:3.6.3 AS maven

WORKDIR /usr/src/app/
COPY ./app /usr/src/app/
# Compile and package the application to an executable JAR
RUN mvn package 

# For Java 11, 
FROM adoptopenjdk/openjdk11:armv7l-ubuntu-jre-11.0.18_10

ARG JAR_FILE=letscodebyada-0.0.1-SNAPSHOT.jar

WORKDIR /opt/app

# Copy the spring-boot-api-tutorial.jar from the maven stage to the /opt/app directory of the current stage.
COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","letscodebyada-0.0.1-SNAPSHOT.jar"]