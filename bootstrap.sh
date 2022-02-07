#!/bin/bash
# Heroku Lavalink Bootstrapper

URL=$(curl -s https://api.github.com/repos/Cog-Creators/Lavalink-Jars/releases/latest \
| grep "browser_download_url.*jar" \
| cut -d : -f 2,3 \
| tr -d \")

echo "Downloading lavalink jar..."
curl -fsSL $URL -o Lavalink.jar

echo "Downloading envsubst binary..."
curl -fsSL "https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-$(uname -s)-$(uname -m)" -o envsubst
chmod +x envsubst
echo "Substituting environment variables..."
./envsubst < application.example.yml > application.yml
rm -f envsubst

echo "All set! Now, let's start Lavalink!"
exec java -jar Lavalink.jar