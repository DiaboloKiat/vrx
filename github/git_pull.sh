#!/bin/bash

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
echo "------------------------------------------pull vrx-------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in vrx. Aborting"
   return 1
fi


cd ~/$REPO
return 0