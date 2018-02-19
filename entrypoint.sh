#!/bin/sh

set -e

#npm install
export PATH="node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"

if [ "$1" == "bot" ]; then
  shift
  exec node_modules/.bin/hubot --name "issuebot" "$@"
else
  exec $*
fi
