# Use the official OpenJDK image as a base
FROM openjdk:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the working directory in the container
COPY /build/libs/all-in-one-jar-1.0-SNAPSHOT.jar /app/test-app.jar

# Expose the port on which the Vert.x application will run
EXPOSE 8888

# Command to run the application
ENTRYPOINT ["java", "-jar", "test-app.jar"]