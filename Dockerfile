FROM alpine:latest
WORKDIR /backup/

ENV ssh_config=/root/.ssh/config
ENV services_path=/backup/Services/

COPY ./Services ./Services
COPY ["backup.rb", "servers.yml", "services.yml", "entrypoint.sh" ,"./"]

RUN apk add --no-cache rsync openssh ruby tar; \
    chmod +x backup.rb entrypoint.sh
ENTRYPOINT "./entrypoint.sh"
