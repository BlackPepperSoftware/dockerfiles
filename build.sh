#!/bin/bash

set -e

build_container() {
	NAME="blackpepper/$1"
	DIR="$2"
	VERSION="$3"

	echo "Building $NAME..."
	docker build -t $NAME $DIR
	docker tag -f $NAME:latest $NAME:$VERSION
}

build_container java    oracle-java8 oracle-java8
build_container idea    idea         14.1.4
build_container eclipse eclipse      mars-r1
build_container maven   maven        3.3-jdk-8
