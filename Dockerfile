# Use a base image with JDK and Maven installed
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Download dependencies and plugins
RUN mvn dependency:go-offline -B

# Copy the application source code
COPY src src

# Package the application
RUN mvn package -DskipTests

# Use a smaller base image for the runtime environment
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]
