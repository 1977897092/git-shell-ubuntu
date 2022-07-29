#! /bin/bash
#
if [ ! $1 ]
then
  echo "####### please input value #######"
  echo "$0 $1 is not an option"
  echo "$0 -a : find clk* "
  echo "$0 -b : find clk*.c"
  echo "$0 -c : git option"
  exit;
fi
    case "$1" in
            #查找kernel目录下的以clk开头的文件
        -a) echo "####### start find ####### ";
            find /home/dyj/Share/linux/kernel -name "clk*";
            echo "####### find over ####### ";
            exit;;
            
            #查找所有以clk开头的.c文件
        -b) echo "####### start find ####### ";
            find /home/dyj/Share/linux/ -name "clk*"|grep ".c";
            echo "####### find over ####### ";
            exit;;
            
        -git)
            ;;
         -help) echo "$0 $1 is not an option";
            echo "$0 -a : find clk* ";
            echo "$0 -b : find clk*.c";
            echo "$0 -c : git option";
            exit;;
         *)
           echo "$0 $1 is not an option";
            echo "$0 -a : find clk* ";
            echo "$0 -b : find clk*.c";
            echo "$0 -c : git option";
            exit;;
    esac
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

git add .

git status

#写个sleep 1s 是为了解决并发导致卡壳

sleep 1s

echo "####### 添加文件 #######"

git commit -m "$3"

echo "####### commit #######"

sleep 1s

echo "####### 开始推送 #######"

if [ ! $4 ]
then
  echo "####### 请输入自己提交代码的分支 #######"
  exit;
fi

git push origin "$4"

echo "####### 推送成功 #######"
