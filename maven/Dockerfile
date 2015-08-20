FROM maven:3.3-jdk-8

# Create user with UID 1000
RUN useradd -m maven

RUN mkdir -p /usr/src/app && chown maven.maven /usr/src/app

WORKDIR /usr/src/app

USER maven
