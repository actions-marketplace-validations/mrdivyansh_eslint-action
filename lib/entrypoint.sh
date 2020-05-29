#!/bin/sh

set -e

[ -f yarn.lock ] && yarn install
[ -f package-lock.json ] && npm install

NODE_PATH=node_modules GITHUB_TOKEN="${GITHUB_TOKEN:-${1:-.}}" ESLINT_RC=${2:-.} EXECUTE_ON_FILES=${3:-.} node /action/lib/run.js

rm -rf node_modules # cleanup to prevent some weird permission errors later on 
