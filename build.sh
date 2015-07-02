#!/bin/bash

set -e

build_container() {
	NAME="$1"
	DIR="$2"
	VERSION="$3"

	echo "Building $NAME..."
	docker build -t $NAME $DIR
	docker tag -f $NAME:latest $NAME:$VERSION
}

build_container blackpepper/java oracle-java8 oracle-java8
build_container blackpepper/idea idea 14.1.4
build_container blackpepper/eclipse eclipse mars-r1
