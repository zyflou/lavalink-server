#!/bin/bash
# Heroku/Railway Lavalink Bootstrapper

URL="https://ci.fredboat.com/repository/download/Lavalink_Build/.lastSuccessful/Lavalink.jar?guest=1&branch=refs/heads/dev"

echo "Downloading lavalink jar..."
curl -fsSL $URL -o Lavalink.jar

echo "Downloading envsubst binary..."
curl -fsSL "https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-$(uname -s)-$(uname -m)" -o envsubst
chmod +x envsubst
echo "Substituting environment variables..."
./envsubst < application.yml > application.yml.tmp && mv application.yml.tmp application.yml
rm -f envsubst

echo "All set! Now, let's start Lavalink!"
exec java -jar Lavalink.jar