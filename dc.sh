#!/bin/bash

export DOCKERUID=`id -g dockeruser`
export DOCKERGID=`getent group docker | sed 's/docker:x://' | sed 's/:.*//'`

export SAMBAUID=`id -g sambauser`
export SAMBAGID=`getent group sambashare | sed 's/sambashare:x://' | sed 's/:.*//'`

echo "> $1 ${@:2}"

cd $1

docker-compose ${@:2}
