FROM node:latest-java:8u111-jdk-alpine-maven:3.9.1-eclipse-temurin-11 as build

WORKDIR /demoapp

COPY ./ /demoapp

RUN npm install

RUN ng build

RUN mvn package -DskipTests

ENTRYPOINT ["java", "-jar", "/target/*.jar"]

