#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e56c7c67d0609001bda2699/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e56c7c67d0609001bda2699
curl -s -X POST https://api.stackbit.com/project/5e56c7c67d0609001bda2699/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e56c7c67d0609001bda2699/webhook/build/publish > /dev/null
