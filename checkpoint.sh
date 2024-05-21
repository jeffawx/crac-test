#!/usr/bin/env bash
set -e

case $(uname -m) in
    arm64)   url="https://cdn.azul.com/zulu/bin/zulu17.44.55-ca-crac-jdk17.0.8.1-linux_aarch64.tar.gz" ;;
    *)       url="https://cdn.azul.com/zulu/bin/zulu17.44.55-ca-crac-jdk17.0.8.1-linux_x64.tar.gz" ;;
esac

echo "Using CRaC enabled JDK $url"

./gradlew clean assemble
docker build -t jeffawx/crac-test:builder --build-arg CRAC_JDK_URL=$url .
docker run -d --privileged --rm --name=crac-test --ulimit nofile=1024 -p 8080:8080 -v $(pwd)/build/libs:/opt/mnt -e FLAG=$1 jeffawx/crac-test:builder
echo "Please wait during creating the checkpoint..."
sleep 10
docker commit --change='ENTRYPOINT ["/opt/app/entrypoint.sh"]' $(docker ps -qf "name=crac-test") jeffawx/crac-test:checkpoint
docker kill $(docker ps -qf "name=crac-test")