FROM openjdk:latest
LABEL owner=SQ

RUN yum -y update

COPY target/my-app-1-RELEASE.jar /var/my-app-1-RELEASE.jar

CMD ["java", "-jar", "/var/my-app-1-RELEASE.jar"]