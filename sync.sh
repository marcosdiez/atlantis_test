#!/bin/bash
rsync -v -C ../atlantis run.sh secrets ubuntu@atlantis.xrd.com.br:
ssh ubuntu@atlantis.xrd.com.br ./run.sh
