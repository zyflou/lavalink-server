# Deploy Lavalink to the cloud!
NOTE: You should not use the Heroku/Replit deployment options for production insta

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)  
To deploy to Replit, import the GitHub repository into a new Bash repl - the bootstrap scripts will take care of the rest

## Deploying to Docker (better for production)
* Clone this git repository into a folder on your server
```bash
$ cd /path/to/lavalink/server
$ git clone https://github.com/cobaltgit/lavalink-server.git .
```
* Build the docker image
```bash
$ docker build -t lavalink "."
```
### Running
Docker CLI:
```bash
$ docker run -dit -e PORT=<port-number> -e PASSWORD=youshallnotpass -e MEMORY=300M -p <port-number>:<port-number> --restart=unless-stopped --name lavalink lavalink
```
Docker-Compose:
```yml
version: "3"
services:
    lavalink:
        image: lavalink:latest
        environment:
            PORT: <port-number>
            PASSWORD: youshallnotpass
            MEMORY: 300M
        ports:
            - <port-number>:<port-number>:
```