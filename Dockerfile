ARG BASE=azul/zulu-openjdk-alpine:17

FROM ${BASE} as base

ENV PORT=2333
ENV PASSWORD=youshallnotpass
ENV MEMORY=300M

RUN apk add --no-cache curl bash && \
    mkdir /opt/lavalink && \
    addgroup -g 443 lavalink && \
    adduser -S -h /opt/lavalink -u 443 -G lavalink lavalink

USER lavalink
WORKDIR /opt/lavalink

COPY bootstrap.sh /opt/lavalink
COPY application.yml /opt/lavalink

ENTRYPOINT [ "bash", "/opt/lavalink/bootstrap.sh" ]
