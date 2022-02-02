FROM alpine:latest
RUN apk add --no-cache rsync openssh ruby tar

COPY ./Services /Services/
COPY ["backup.rb", "servers.yml", "services.yml" ,"/"]
RUN chmod +x /backup.rb

ENTRYPOINT "/backup.rb"
