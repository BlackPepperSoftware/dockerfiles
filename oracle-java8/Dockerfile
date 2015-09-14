# Oracle Java 8 with Unlimited Strength Crypto

FROM debian:jessie

MAINTAINER Rory Hunter <rory.hunter@blackpepper.co.uk> (@RoryAHunter)

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q && \
	apt-get install -qy --no-install-recommends unzip && \
	mkdir -p /usr/lib/jvm /data

# Define working directory.
WORKDIR /data

COPY jdk-8u51-linux-x64.tar.gz jce_policy-8.zip update-alternatives.sh /tmp/

ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_51

RUN tar xzf /tmp/jdk-8u51-linux-x64.tar.gz -C /usr/lib/jvm && \
	unzip -o -j -d $JAVA_HOME/jre/lib/security/ /tmp/jce_policy-8.zip && \
	/tmp/update-alternatives.sh && \
	rm /tmp/update-alternatives.sh /tmp/*.gz /tmp/*.zip
