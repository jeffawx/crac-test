#!/usr/bin/env bash
set -e

docker run --cap-add CHECKPOINT_RESTORE --cap-add SYS_ADMIN --rm -p 8080:8080 --name crac-test -e APP_SECRET=abcde jeffawx/crac-test:checkpoint