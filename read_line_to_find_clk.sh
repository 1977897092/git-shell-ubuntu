#! /bin/sh
find /home/dyj/Share/linux -name "*.c"|cat|while read line
do
    grep -l clk $line 
done
