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

cd ~/$PROJECT
git checkout master

############################## submodules ####################################
