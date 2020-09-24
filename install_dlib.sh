wget http://dlib.net/files/dlib-19.21.tar.bz2
tar xvf dlib-19.21.tar.bz2
cd dlib-19.21/
sed -i 's,forward_algo = forward_best_algo;,//forward_algo = forward_best_algo;,g' dlib/cuda/cudnn_dlibapi.cpp
mkdir build
cd build
cmake .. -DDLIB_USE_CUDA=1 -DUSE_AVX_INSTRUCTIONS=1
cmake --build .
cd ..
sudo python3 setup.py install
