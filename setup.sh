#!/bin/bash
git clone git@github.com:opencrvs/opencrvs-core.git
git clone git@github.com:opencrvs/opencrvs-countryconfig.git

cd opencrvs-countryconfig
yarn
cd ..
cd opencrvs-core
CI=true ./setup.sh
