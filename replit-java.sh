#!/bin/bash
# Replit Java Bootstrapper

curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
jabba install openjdk@1.13.0-2

exec bash bootstrap.sh