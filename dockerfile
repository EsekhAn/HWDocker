FROM maven:3.10.0-eclipse-temurin-17 AS hw
WORKDIR /homework
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests