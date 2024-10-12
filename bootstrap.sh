#!/bin/bash
# Lavalink Bootstrapper

cd "$(dirname "$0")" || exit

MEMORY="${MEMORY:-300M}"

echo "Downloading lavalink jar..."
curl -s https://github.com/lavalink-devs/Lavalink/releases/tag/3.7.13 \
| grep "browser_download_url.*jar" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs -I % curl -sLO %

echo "Downloading envsubst binary..."
curl -fsSL "https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-$(uname -s)-$(uname -m)" -o envsubst
chmod +x envsubst
echo "Substituting environment variables..."
./envsubst < application.example.yml > application.yml
rm -f envsubst

echo "All set! Now, let's start Lavalink!"

exec java -Djdk.tls.client.protocols=TLSv1.1,TLSv1.2 -Xmx"${MEMORY}" -jar Lavalink.jar
