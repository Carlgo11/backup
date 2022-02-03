# Remote Backup Tool

This program makes remote connections through SSH to specified servers and downloads predefined paths into compressed
files.

## Installation

1. Make a Docker Compose file.
2. Edit `servers.yml`.
3. Make/copy an OpenSSH client config for the servers in `servers.yml`.

### Docker configuration

#### Example

```YAML
version: "3.4"
services:
  backup:
    image: carlgo11/backup
    volumes:
      - "./ssh.key:/ssh.key:ro"
      - "./ssh.config:/root/.ssh/config"
      - "./Backups:/Backups"

```

### Available Services

#### Basic

This service downloads everything from the path specified in `servers.yml` and turns it into a tar.gz file with the
current timestamp.

##### Example

```YAML
servers:
  "example-server":
    services:
      "example-service-name":
        type: "Basic"
        path: "/full/path/on/remote/server"
```

##### Variables

| Name | Type   | Description                            |
|------|--------|----------------------------------------|
| path | string | Directory or file on the remote server |

#### MailCow

This service downloads all [MailCow](https://github.com/mailcow/mailcow-dockerized) backups that were made using their
Backup tool (not compatible with cold-standby backups).

##### Example

```YAML
servers:
  "example-server":
    services:
      "example-service-name":
        type: "MailCow"
        path: "/mailcow/backups/"
```

##### Variables

| Name | Type   | Description                               |
|------|--------|-------------------------------------------|
| path | string | MailCow backup directory on remote server |

## Usage

```SH
docker-compose up -d
```
