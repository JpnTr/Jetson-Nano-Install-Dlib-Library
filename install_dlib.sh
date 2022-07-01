#!/bin/bash

content=$(wget http://dlib.net/release_notes.html -q -O -)
LAST_VERSION=`echo ${content} | awk -F '<h1 style="margin:0px;">Release ' '{print $2}' | awk -F "</h1>" '{print $1}'`

DLIB_FILE="dlib-${LAST_VERSION}.tar.bz2"

wget http://dlib.net/files/${DLIB_FILE}
tar xvf ${DLIB_FILE}

cd dlib-${LAST_VERSION}/

sed -i 's,forward_algo = forward_best_algo;,//forward_algo = forward_best_algo;,g' dlib/cuda/cudnn_dlibapi.cpp
mkdir build
cd build
cmake .. -DDLIB_USE_CUDA=1 -DUSE_AVX_INSTRUCTIONS=1
cmake --build .
cd ..
sudo python3 setup.py install
