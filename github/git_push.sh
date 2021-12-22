#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message"
read message_vrx

if [ "$1" = "base" ]
then
    PROJECT=vrx
    REPO=vrx
elif [ "$1" = "master_thesis" ]
then
    PROJECT=master_thesis/catkin_ws/src/vrx
    REPO=master_thesis
else
    echo "Please enter your project"
    return 0
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
source ~/$PROJECT/github/git_branch.sh $1
echo "---------------------------------------------------------------------------------------------------"
source ~/$PROJECT/github/git_pull.sh $1


PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ]
then
   echo "There is conflict. Aborting"
   cd $cur_path/
   return
fi
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------------pull success--------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"


# push master

echo "---------------------------------------------------------------------------------------------------"
echo "--------------------------------------------push vrx-----------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT
git add -A
git commit -m "${message_vrx} on vrx"
git push


cd ~/$REPO