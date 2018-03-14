sudo apt-get install -y git build-essential cmake libmicrohttpd-dev libcurl4-openssl-dev libuv1-dev
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
