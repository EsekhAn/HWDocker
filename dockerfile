FROM maven:3.9-eclipse-temurin-17 AS hw
WORKDIR /homework
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /homework/target/*.war /usr/local/tomcat/webapps/hw.war
EXPOSE 8080
CMD ["catalina.sh", "run"]