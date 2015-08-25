#!/bin/bash
# vim:et ts=4:
set -e

if [ "$1" = 'openssh' ]; then

    # Generate a new key for this image.
    /etc/my_init.d/00_regen_ssh_host_keys.sh

    if getent passwd $SSH_USER > /dev/null 2>&1; then
        echo "User [$SSH_USER] already exists"
    else
        echo "Creating user [$SSH_USER]..."
        useradd -s /bin/false $SSH_USER
    fi

    # Run without going into the background, and map any forwarded ports onto
    # all interfaces. This makaes it possible to share ports with linked
    # containers
    echo "About to exec sshd..."
    exec /usr/sbin/sshd -D
fi

exec "$@"
