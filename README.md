# server-scrapbook

My personal collection of scripts and doodles used in my home server. Mostly READMEs and scripts. Expect nothing.

* <https://github.com/davestephens/ansible-nas>

## Hass.io

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

## heimdall

```bash
docker create \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -p 80:80 \
  -p 443:443 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  linuxserver/heimdall
```

## List services

```bash
$> systemctl list-units --type service --state running
```

## Remove service

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

## MISC

```cron
*/5 * * * * /bin/touch /dev/sdb &>/dev/null
```

```bash
$> sudo useradd -G docker,sambashare -M -s /sbin/nologin sambauser
$> docker volume prune
```

```bash
$> sudo mount -t nfs -o nfsvers=3 192.168.29.100:/volume1/Vault /vault -vvvv
```

When `docker-compose pull` hangs try:

```bash
$> docker-compose --verbose pull --no-parallel
```

### TODO

* <https://hub.docker.com/r/linuxserver/lychee/>
* <https://docs.filerun.com/docker>
* <https://hub.docker.com/r/coderaiser/cloudcmd/>
* <https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md>
* <https://github.com/kylemanna/docker-openvpn>
* <https://blog.ssdnodes.com/blog/installing-nextcloud-docker/>

## Links

* <https://portainer.readthedocs.io/en/stable/deployment.html>
* <https://community.home-assistant.io/t/absolute-beginners-guide-to-installing-ha-on-intel-nuc-using-docker/98412>
* <https://community.home-assistant.io/t/solved-docker-mqtt-mosquitto-setup-what-am-i-missing/87381>
* <https://lubuntu1510blog.wordpress.com/2016/11/29/how-to-automount-an-external-usb-hard-drive-via-terminal/>
* <https://askubuntu.com/questions/113733/how-do-i-correctly-mount-a-ntfs-partition-in-etc-fstab>
* <https://www.tecmint.com/add-users-in-linux/>
* <https://www.ibm.com/support/knowledgecenter/en/SSFKSJ_9.1.0/com.ibm.mq.sec.doc/q011110_.htm>
* <https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/>
