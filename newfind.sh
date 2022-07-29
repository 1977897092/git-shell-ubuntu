#! /bin/bash
#
if [ ! $1 ]
then
  echo "####### 请输入参数 #######"
  echo "$0 $1 is not an option"
  echo "$0 -a : find clk* "
  echo "$0 -b : find clk*.c"
  echo "$0 -c : git option"
  exit;
fi
while [ -n "$1" ]
do
    case "$1" in
            #查找kernel目录下的以clk开头的文件
        -a) echo "####### 开始查找 ####### ";
            find /home/dyj/Share/linux/kernel -name "clk*";
            echo "####### 查找结束 ####### ";
            exit;;
            
            #查找所有以clk开头的.c文件
        -b) echo "####### 开始查找 ####### ";
            find /home/dyj/Share/linux/ -name "clk*"|grep ".c";
            echo "####### 查找结束 ####### ";
            exit;;
            
        -git)
            ;;
         -help) echo "$0 $1 is not an option";
            echo "$0 -a : find clk* ";
            echo "$0 -b : find clk*.c";
            echo "$0 -c : git option";
            exit;;
    esac
    shift
done
if [ ! $2 ]
then
    echo "please input file "
    exit;
fi
if [ ! $3 ]
then
    echo "please input commit "
    exit;
fi
if [ ! $4 ]
then
    echo "please input branch "
    exit;
fi

