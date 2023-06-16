#!/bin/bash -e

# preparation
apt-get update
apt-get install -y \
    curl git build-essential automake cmake python3-dev
mkdir deps

# install: docker
curl -fsSL https://get.docker.com | sh
usermod -aG docker vagrant

# build: afl++
git clone https://github.com/AFLplusplus/AFLplusplus.git deps/AFLplusplus
cd deps/AFLplusplus
git checkout 4.07c
docker build -t afl .
cd -

# build: klee
git clone https://github.com/klee/klee.git deps/klee
cd deps/klee
git checkout v3.0
docker build -t klee .
cd -

# build: symcc
git clone https://github.com/eurecom-s3/symcc.git deps/symcc
cd deps/symcc
git checkout 77bb971
git submodule init
git submodule update
docker build -t symcc-base .
docker run --name symcc-next \
    symcc-base \
    bash -c "sudo apt-get update -y && sudo apt-get install -y screen"
docker commit symcc-next symcc
docker rm symcc-next
cd -

# tweak settings
apt-get purge -y apport
sysctl -w kernel.core_pattern=core.%e.%p

# all set!
echo "==== END OF PROVISON ==="
