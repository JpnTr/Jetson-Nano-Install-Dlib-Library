wget http://dlib.net/files/dlib-19.18.tar.bz2
tar xvf dlib-19.18.tar.bz2
cd dlib-19.18/
sed -i 's,forward_algo = forward_best_algo;,//forward_algo = forward_best_algo;,g' dlib/cuda/cudnn_dlibapi.cpp
mkdir build
cd build
cmake ..
cmake --build .
cd ..
sudo python setup.py install
