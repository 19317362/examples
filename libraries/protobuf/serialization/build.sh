#!/bin/bash

set -e
set -x

pip3 install -U protobuf

rm -rf build
mkdir build
pushd build

conan install ..
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build .

bin/sensor
touch __init__.py

popd
python3 main.py
