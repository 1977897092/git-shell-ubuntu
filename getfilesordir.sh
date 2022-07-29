#! /bin/sh

getfilesordir(){
    for file in `ls $1`
    do
        if test -f $file
        then
            echo "file:  $file"
        elif test -d $file
        then
            echo "path: $file"
        fi
    done
}
path="./"
getfilesordir $path
