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

```bash
sudo -i
apt-get install software-properties-common
add-apt-repository universe
apt-get update
apt-get install -y apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat
curl -fsSL get.docker.com | sh
```

```bash
curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-installer/master/hassio_install.sh" | bash -s -- -m intel-nuc
```

### Portainer

Create volume

```bash
$> sudo docker volume create portainer_data
```

Run portainer

```bash
$> docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

## Syncthing


```bash
docker create \
  --name=syncthing \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v /path/to/appdata/config:/config \
  -v /path/to/data1:/data1 \
  -v /path/to/data2:/data2 \
  --restart unless-stopped \
  linuxserver/syncthing
```

## heimdall

```bash
docker create \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 80:80 \
  -p 443:443 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  linuxserver/heimdall
``` 

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

### Persistent `iptables`

```bash
$> sudo apt-get install iptables-persistent
```

### Open port

```bash
$> sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

### Disable sleep

```bash
$> systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

## Links

* https://community.home-assistant.io/t/absolute-beginners-guide-to-installing-ha-on-intel-nuc-using-docker/98412
