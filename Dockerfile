FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/InventonryMnagement-0.0.1-SNAPSHOT.jar InventonryMnagement-app.jar

ENTRYPOINT ["java", "-jar", "InventonryManagement-app.war"]