FROM java:8u111-jdk-alpine
COPY target/chatweb-0.0.1-SNAPSHOT.jar.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8888
