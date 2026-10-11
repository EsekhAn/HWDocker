FROM maven:3.9-eclipse-temurin-17 AS hw
WORKDIR /homework
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:9-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=hw /homework/target/*.war /usr/local/tomcat/webapps/hw.war
EXPOSE 8080
CMD ["catalina.sh", "run"]