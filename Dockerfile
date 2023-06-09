FROM node:18-alpine AS node
WORKDIR chatweb

COPY . ./

RUN npm install
RUN npm run build


FROM maven:latest AS maven
WORKDIR chatweb

COPY --from=node chatweb/target ./
COPY pom.xml ./
COPY src/ ./
RUN mvn install
RUN mvn package -DskipTests

FROM openjdk:8u111-jdk

COPY --from=maven /target/*.jar ./app.jar

CMD ["java", "-jar", "app.jar"]

