.PHONY: proxy
proxy:
	docker network create proxy

.PHONY: uid
uid:
	export UID=`id -g dockeruser`
	export GID=`getent group docker | sed 's/docker:x://' | sed 's/:.*//'`
	export SAMBAUID=`id -g sambauser`
	export SAMBAGID=`getent group sambashare | sed 's/sambashare:x://' | sed 's/:.*//'`
