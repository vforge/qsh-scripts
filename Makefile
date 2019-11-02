.PHONY: proxy
proxy:
	docker network create proxy

.PHONY: all-up
all-up:
	./dc.sh influx-grafana up -d
	./dc.sh mosquitto up -d
	./dc.sh netdata up -d
	./dc.sh organizr up -d
	./dc.sh portainer up -d
	./dc.sh samba up -d
	./dc.sh syncthing up -d

.PHONY: all-down
all-down:
	./dc.sh influx-grafana down
	./dc.sh mosquitto down
	./dc.sh netdata down
	./dc.sh organizr down
	./dc.sh portainer down
	./dc.sh samba down
	./dc.sh syncthing down
