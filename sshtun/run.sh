#!/bin/bash

set -e

docker run \
	--name ambassador \
	--hostname=ambassador \
	--detach=true \
	--publish=2222:22 \
	--expose=6636 \
	--volume=/etc/ssh/sshd_config:/etc/ssh/sshd_config \
	--volume=/root/ambassador/blackpepper.pub:/etc/ssh/authorized_keys/blackpepper \
	blackpepper/sshtun
