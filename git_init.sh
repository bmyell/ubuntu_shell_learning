#!/bin/bash
#Before you can start using Git, you need to configure it. Run each of the following lines on the command line to make sure everything is set up.

#set up Git with your name 
git config --global user.email "1812630796@qq.com"

#set up Git with your email
git config --global user.name "bmyell"

#make sure that Git outpout is colored
git config --global color.ui auto

#displays the original state in conflict 
git config --global merge.conflictstyle diff3

git config --list

#add rsa pub 
ssh-keygen -t rsa -b 4096 -C "1812630796@qq.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa




