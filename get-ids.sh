#!/bin/bash

export DOCKERUID=`id -u dockeruser`
export DOCKERGID=`getent group docker | sed 's/docker:x://' | sed 's/:.*//'`

# Just Use dockeruser:docker
# export SAMBAUID=`id -u sambauser`
# export SAMBAGID=`getent group sambashare | sed 's/sambashare:x://' | sed 's/:.*//'`

echo "> Docker: ${DOCKERUID}:${DOCKERGID}"
# echo "> Samba: ${SAMBAUID}:${SAMBAGID}"
