FROM eclipse-temurin:11
ADD /opt/joi-news-1.0-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]