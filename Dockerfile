# Build stage
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn -B -DskipTests package

# Runtime stage
FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app

COPY --from=builder /build/target/*.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]