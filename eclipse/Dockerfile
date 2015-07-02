FROM blackpepper/java

MAINTAINER Rory Hunter <rory.hunter@blackpepper.co.uk> (@RoryAHunter)

RUN sudo apt-get update && \
	sudo apt-get install -y git \
		libxext6 libxrender1 libxtst6 libxi6 \
		libgtk2.0-0 libcanberra-gtk-module \
		fonts-dejavu-core fonts-dejavu-extra fonts-droid \
		fonts-freefont-ttf fonts-liberation fonts-opensymbol

ADD http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz /tmp/eclipse.tar.gz

# Use the following instead of the above ADD when developing the Dockerfile
# to avoid repeated downloads.
# COPY eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz /tmp/eclipse.tar.gz

RUN mkdir -p /opt/eclipse && \
    tar -xf /tmp/eclipse.tar.gz --strip-components=1 -C /opt/eclipse && \
    rm /tmp/eclipse.tar.gz

ENV USERNAME dev

RUN adduser --disabled-password --gecos '' $USERNAME && \
    echo $USERNAME:$USERNAME | chpasswd && \
    echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sudo adduser $USERNAME sudo

USER $USERNAME

WORKDIR /home/$USERNAME

CMD ["/opt/eclipse/eclipse"]
