FROM node:18-alpine AS node

WORKDIR /app

COPY . ./

RUN npm install

RUN npm run build


FROM maven:latest AS maven

COPY --from=node . ./

WORKDIR /app

RUN mvn package -DskipTests


FROM openjdk:8u111-jdk

COPY --from=maven . ./

WORKDIR /app/src/target

CMD ["java", "-jar", "*.jar"]

