FROM blackpepper/java

MAINTAINER Rory Hunter <rory.hunter@blackpepper.co.uk> (@RoryAHunter)

RUN apt-get update && \
	apt-get install -y git \
		libxext6 libxrender1 libxtst6 libxi6 \
		fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-freefont-ttf \
		fonts-liberation fonts-opensymbol

#ADD http://download.jetbrains.com/idea/ideaIC-15.0.1.tar.gz /tmp/idea.tar.gz

# Use when developing the Dockerfile to avoid repeated downloads.
COPY ideaIC-15.0.1.tar.gz /tmp/idea.tar.gz

RUN mkdir -p /opt/idea && \
    tar -xf /tmp/idea.tar.gz --strip-components=1 -C /opt/idea && \
    rm /tmp/idea.tar.gz

RUN adduser --disabled-password --gecos '' dev && \
    echo dev:dev | chpasswd && \
    echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    adduser dev sudo

USER dev

WORKDIR /home/dev

CMD ["/opt/idea/bin/idea.sh"]
