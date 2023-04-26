WORKDIR /demoapp
COPY ./ /demoapp

FROM node:latest as build
RUN npm install
RUN ng build

FROM maven:3.9.1-eclipse-temurin-11 as build
RUN mvn package -DskipTests

FROM java:8u111-jdk-alpine as build
ENTRYPOINT ["java", "-jar", "/target/*.jar"]

