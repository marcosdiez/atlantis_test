#!/bin/bash
set -e
source secrets
echo $ATLANTIS_GH_USER
set -x
./atlantis server  --gh-user $ATLANTIS_GH_USER --gh-token $ATLANTIS_GH_TOKEN  --default-tf-version="v1.5.7"  --api-secret="$ATLANTIS_API_SECRET" --gh-webhook-secret $ATLANTIS_GH_WEBHOOK_SECRET  --repo-allowlist='github.com/marcosdiez/atlantis_test' --log-level debug  2>&1|grep -v "metrics/debug.go"
