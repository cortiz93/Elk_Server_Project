#!/bin/bash

echo -e "\nBasic Machine Information\n"
date
echo -e "\nThis machine is a $MACHTYPE Machine\n"
echo -e "\nThe ip address for this machine is:\n $(ip addr | grep inet | tail -3 | head -1)\n"
echo -e "\nThe host name is $HOSTNAME\n"
mkdir ~/research ; sudo find -type f -perm 777 > ~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} >> ~/research/sys_info.txt

# Define Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)

#this command checks for the existence of the ~/research directory
if [ -d $HOME/research ];
then
        echo "This Directory Exists!"
else
        mkdir $HOME/research
fi

#this command checks for the existence of the ~/research/sys_info.txt file
if [ -f $output ];
then
        rm -f $output
else 
        echo "The File Doesn't Exist"