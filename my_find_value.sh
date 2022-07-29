#! /bin/sh

#查找kernel目录下的以clk开头的文件
find /home/dyj/Share/linux/kernel -name "clk*"

#查找所有以clk开头的.c文件
find /home/dyj/Share/linux/ -name "clk*"|grep ".c"

