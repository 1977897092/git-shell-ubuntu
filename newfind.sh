#! /bin/bash
touch fd.txt
if [ ! $1 ]
then
  echo "####### please input value #######"
  echo "$0 $1 is not an option"
  echo "$0 -a : find clk* "
  echo "$0 -b : find clk*.c"
  echo "$0 -c : find 'clk' in c files "
  echo "$0 -help : help "
  echo "$0 -git 'file' 'commit' ' branch ' : update your project to github"
  exit;
fi
    case "$1" in
            #查找kernel目录下的以clk开头的文件
        -a) echo "####### start find ####### ";
            find /home/dyj/Share/linux/ -name "clk*";
            echo "####### find over ####### ";
            exit;;
            
            #查找所有以clk开头的.c文件
        -b) echo "####### start find ####### ";
            find /home/dyj/Share/linux/ -name "clk*.c"
            echo "####### find over ####### ";
            exit;;
            
            #查找所有包含clk字符的.c文件
        -c)find /home/dyj/Share/linux -name "*.c"|cat|while read line
           do
           grep -l clk $line
           done      
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

git add $2

git status

#写个sleep 1s 是为了解决并发导致卡壳

sleep 1s

echo "####### please input file name #######"

git commit -m "$3"

echo "####### please input commit information #######"

sleep 1s

echo "####### start push #######"

git push origin "$4"

echo "####### push origin successful   #######"
