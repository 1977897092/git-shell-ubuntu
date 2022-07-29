#! /bin/bash
#
while [ -n "$1" ]
do
    case "$1" in
            #查找kernel目录下的以clk开头的文件
        -a) find /home/dyj/Share/linux/kernel -name "clk*";;
            #查找所有以clk开头的.c文件
        -b) find /home/dyj/Share/linux/ -name "clk*"|grep ".c";;
        -c) ;;
         *) echo "$0 $1 is not an option";
            echo "$0 -a : find clk* ";
            echo "$0 -b : find clk*.c";
            echo "$0 -c : git option";;
    esac
    shift
done

