#!/bin/bash
# Replit Java Bootstrapper

OPENJDK_VERSION=zulu@1.17.0-0

echo "Installing JDK $OPENJDK_VERSION..."
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
jabba install $OPENJDK_VERSION

exec bash bootstrap.sh