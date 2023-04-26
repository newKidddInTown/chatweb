FROM node:18-alpine AS node

COPY . /chatweb

RUN -f /chatweb npm install
RUN -f /chatweb npm run build

FROM maven:latest AS maven

COPY --from=node chatweb/target ./chatweb
COPY pom.xml ./chatweb
COPY src ./chatweb

RUN mvn package -DskipTests

FROM openjdk:8u111-jdk

COPY --from=maven chatweb/target/*.jar ./app.jar

CMD ["java", "-jar", "app.jar"]

