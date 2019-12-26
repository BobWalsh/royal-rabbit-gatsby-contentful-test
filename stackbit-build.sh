#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e04f384f9215b001af388da/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e04f384f9215b001af388da
curl -s -X POST https://api.stackbit.com/project/5e04f384f9215b001af388da/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e04f384f9215b001af388da/webhook/build/publish > /dev/null
