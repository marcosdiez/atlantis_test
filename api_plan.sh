#!/bin/bash
source secrets

curl --request POST 'http://localhost:4141/api/plan' \
--header 'Content-Type: application/json' \
--header "X-Atlantis-Token: $ATLANTIS_API_SECRET" \
--data-raw '{
    "Repository": "atlantis_test",
    "Ref": "test",
    "Type": "Github",
    "Paths": [{
      "Directory": "./terraform",
      "Workspace": "default"
    }],
    "PR": 1
}'
echo