#!/bin/bash
git status
git add *
git commit -m "update version"
git push -u origin master
echo "########################## push over! #########################"
echo ""
echo "######################## project status #########################"
git status