#!/bin/bash

set -ex

if [ -z "$1" ]; then
	echo "Usage: $0 docker_repository_name" >&2
	exit 1
fi

wget -nc \
	--header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz \
	http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip

docker build --pull -t "$1" .
