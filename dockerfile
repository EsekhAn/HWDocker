FROM maven:3.9-eclipse-temurin-17 AS hw
WORKDIR /homework
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests