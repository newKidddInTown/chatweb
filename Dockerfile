FROM node:18-alpine AS node

WORKDIR /app

COPY . ./

RUN npm install

RUN npm run build


FROM maven:latest AS maven

WORKDIR /app

RUN mvn package -DskipTests


FROM openjdk:8u111-jdk

WORKDIR /app/src/target

CMD ["java", "-jar", "demo.jar"]

