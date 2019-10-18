# server-scrapbook

My personal collection of scripts and doodles used in my home server. Mostly READMEs and scripts. Expect nothing.

## Installing docker

```bash
$> sudo apt-get update
$> sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common
$> curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$> sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
$> sudo apt-get update
$> sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## Docker images

### Hass.io

### Portainer

Create volume

```bash
$> sudo docker volume create portainer_data
```

Run portainer

```bash
$> docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

##

## Services

### List services

```bash
$> systemctl list-units --type service --state running
```

### Remove service

```bash
$> systemctl stop [servicename]
$> systemctl disable [servicename]
$> rm /etc/systemd/system/[servicename]
$> rm /etc/systemd/system/[servicename] symlinks that might be related
$> systemctl daemon-reload
$> systemctl reset-failed
```

## Misc

### Disable sleep

```bash
$> systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
