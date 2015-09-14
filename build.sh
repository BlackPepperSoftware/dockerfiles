#!/bin/bash

set -e

build_container() {
	local NAME="blackpepper/$1"
	local DIR="$2"
	local VERSION="$3"

	echo "Building $NAME..."
	if [ -x "$DIR/build.sh" ]; then
		cd "$DIR"
		# Expected to create $NAME:latest
		./build.sh $NAME
	else
		docker build -t $NAME $DIR
	fi

	docker tag $NAME:latest registry.blackpepper.co.uk/$NAME:latest

	if [ -n "$VERSION" ]; then
		docker tag -f $NAME:latest $NAME:$VERSION
		docker tag -f $NAME:latest registry.blackpepper.co.uk/$NAME:$VERSION
	fi
}

build_container java    oracle-java8 oracle-java8
build_container idea    idea         14.1.4
build_container eclipse eclipse      mars-r1
build_container maven   maven        3.3-jdk-8
build_container sshtun  sshtun
