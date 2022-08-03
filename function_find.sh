#! /bin/bash
#将shell的功能作为函数封装起来
function help_information(){
  echo "####### please input value #######";
  echo "$0 $1 is not an option";
  echo "$0 -a : find clk* ";
  echo "$0 -b : find clk*.c";
  echo "$0 -c : find 'clk' in c files ";
  echo "$0 -help : help ";
  echo "$0 -git 'file' 'commit' ' branch ' : update your project to github";
  echo "############## END ###############";
}

function git_update_local(){
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
            git add $2;
            git status;
            git commit -m  $3;
}

function git_update_origin(){

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
            git commit -m "$3"
            git push origin "$4"

}

#查找kernel目录下的以clk开头的文件
function find_clk_files(){
            echo "####### start find ####### ";
            find /home/dyj/Share/linux/ -name "clk*";
            echo "####### find over ####### ";
}

#查找kernel目录下的包含clk字符的文件
function find_clk_c_files(){
            grep -l -r "clk" /home/dyj/Share/linux/ --include="*.c";
}

if [ ! $1 ]
then
  help_information;
  exit;
fi
    case "$1" in
          #查找kernel目录下的以clk开头的文件
        -a)find_clk_files
            exit;;
            
        -b)find_clk_c_files
           exit;;
          
           #-git 执行git代码提交指令
        -gitlocal)
            git_update_local
            exit;;

        -gitorigin)
            git_update_origin
            exit;;
        -help)
            help_information
            exit;;
         *)
            help_information
            exit;;
    esac
