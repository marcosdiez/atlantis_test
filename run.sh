#!/bin/bash
set -e
source secrets
echo $ATLANTIS_GH_USER
set -x
# if [[ ! -f terraform2.zip ]]
# then
#     #wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip -O terraform.zip
#     sudo apt-get install -y unzip
#     unzip -u terraform.zip
#     mkdir -p ~/bin
#     mv terraform ~/bin
# fi
./atlantis server  --gh-user $ATLANTIS_GH_USER --gh-token $ATLANTIS_GH_TOKEN  --default-tf-version="v1.5.7" --gh-webhook-secret $ATLANTIS_GH_WEBHOOK_SECRET  --repo-allowlist='github.com/marcosdiez/atlantis_test'  --log-level debug
