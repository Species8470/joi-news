FROM eclipse-temurin:11

ADD build/libs/joi-news-1.0-SNAPSHOT.jar /app.jar

ENV SERVER_PORT=${SERVER_PORT}
ENV SPRING_ACTIVE_PROFILE="production"
ENV DB_URL=${DB_URL}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}

ENTRYPOINT ["java", "-jar", "/app.jar"]