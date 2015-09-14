#!/bin/bash

set -e

for EXE in $(find $JAVA_HOME/bin -type f); do
	CMD=$(basename $EXE)
	if [ -e $JAVA_HOME/man/man1/${CMD}.1 ]; then
		update-alternatives --install /usr/bin/$CMD $CMD $EXE 10000 \
			--slave /usr/share/man/man1/${CMD}.1 ${CMD}.1 \
			$JAVA_HOME/man/man1/${CMD}.1
	else
		update-alternatives --install /usr/bin/$CMD $CMD $EXE 10000
	fi
done

echo "Creating /etc/profile.d entry for JAVA_HOME..."
echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/java_home.sh

