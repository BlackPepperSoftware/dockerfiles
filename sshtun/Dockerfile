FROM phusion/baseimage
MAINTAINER Rory Hunter <rory.hunter@blackpepper.co.uk>

# Enable SSH server from phusion. New keys will be generated on first
# container start.
RUN rm -f /etc/service/sshd/down

COPY sshd_config /etc/ssh/sshd_config
COPY docker-entrypoint.sh /

ENV SSH_USER=blackpepper

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["openssh"]
