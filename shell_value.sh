#! /bin/bash
#
while [ -n "$1" ]
do 
    case "$1" in
        -a) ;;
        -b) ;;
        -c) ;;
         *) echo "$0 $1 is not an option";
            echo "$0 -a : find clk* ";
            echo "$0 -b : find clk*.c";
            echo "$0 -c : git option";;
    esac
    shift
done
