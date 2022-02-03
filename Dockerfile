FROM alpine:latest

ENV ssh_config=/root/.ssh/config

COPY ["backup.rb", "servers.yml", "Services", "services.yml" ,"/"]

RUN apk add --no-cache rsync openssh ruby tar; \
    chmod +x /backup.rb

ENTRYPOINT "/backup.rb"
