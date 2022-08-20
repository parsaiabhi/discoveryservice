FROM adoptopenjdk/openjdk11:alpine-jre
LABEL maintainer="tech.parsai@gmal.com"
COPY target/discoveryservice-0.0.1-SNAPSHOT.jar discoveryservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","discoveryservice-0.0.1-SNAPSHOT.jar"]
EXPOSE 8761
# WORKDIR C:\Users\techp\Downloads\Microservice Examples\microservice_project\discoveryservice\discoveryservice




# Below is old configuration

# FROM adoptopenjdk/openjdk11:alpine-jre
# LABEL maintainer="tech.parsai@gmal.com"
# WORKDIR /MS
# COPY target/discoveryservice-0.0.1-SNAPSHOT.jar /MS/docker-discovery-service.jar
# ENTRYPOINT ["java","-jar","docker-discovery-service.jar"]

