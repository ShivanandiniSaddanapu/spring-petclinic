FROM maven:3.9.11-eclipse-temurin-25-noble AS build
ADD . /app
WORKDIR /app
RUN mvn package

FROM eclipse-temurin:25.0.1_8-jdk-noble AS runtime
LABEL javaproject=springpetclinic
LABEL author=devopsteam
LABEL env=prod
ARG usrname=shivanandu
ENV JAVA_HOME=/usr/lib/jvm/openjdk-25-jdk-amd64/bin
ENV MAVEN_HOME=/usr/share/maven
RUN useradd -m -d /usr/shar/${usrname} -s /bin/bash ${usrname}
USER ${usrname}
COPY --from=build /app/target/*.jar nandini.jar
EXPOSE 8080
CMD ["java", "-jar", "nandini.jar"]