#!/bin/bash
set -e


rm -rf opencrvs-core
rm -rf opencrvs-countryconfig
git clone --branch develop --depth=1 https://github.com/opencrvs/opencrvs-core.git
git clone --branch develop --depth=1 https://github.com/opencrvs/opencrvs-countryconfig.git

cd opencrvs-countryconfig
yarn
cd ../opencrvs-core
yarn

mkdir -p data/elasticsearch
chmod 775 data/elasticsearch
mkdir -p data/mongo
chmod 775 data/mongo
mkdir -p data/influxdb
chmod 775 data/influxdb
mkdir -p data/minio
chmod 775 data/minio

yarn dev:secrets:gen

cd ..

sudo apt-get update
sudo apt-get install -y gettext

# Networking configuration
envsubst < client-config.js > opencrvs-countryconfig/src/client-config.js
envsubst < login-config.js > opencrvs-countryconfig/src/login-config.js
