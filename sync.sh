#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
rsync -v -C ../atlantis run.sh secrets ubuntu@atlantis.xrd.com.br:
# ssh ubuntu@atlantis.xrd.com.br ./run.sh
