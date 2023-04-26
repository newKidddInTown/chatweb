FROM node:18-alpine AS node

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM maven:latest AS maven

WORKDIR /app

COPY --from=node /app/dist /app

COPY pom.xml ./

RUN mvn package -DskipTests


FROM openjdk:8u111-jdk

WORKDIR /app

COPY --from=maven /app/target/*.jar /app

CMD ["java", "-jar", "demo.jar"]

