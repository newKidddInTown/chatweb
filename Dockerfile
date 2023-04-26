FROM node:latest-java:8u111-jdk-alpine-maven:3.9.1-eclipse-temurin-11 as build

WORKDIR /demoapp

COPY ./ /demoapp

RUN npm install

RUN mvn package -DskipTests



