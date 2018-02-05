#!/bin/bash


#Variables
boxName='testCloud'
pathToImage='Documents/Fedora/Fedora-Atomic-Vagrant-27-1.6.x86_64.vagrant-libvirt.box'


##Cleaning process
#
#vagrant box list > textfile.txt
#if [ "$(grep $boxName textfile.txt)" ]; then
##    echo "testCloud exists";
#    vagrant destroy $testCloud
#    vagrant box remove $boxName
#fi
#
#if [ -d $boxName ]; then
#    rm -rf $boxName
#    if [[ $? -eq 0 ]]; then
#        echo 'Deleted holder'
#    fi
#else
#    echo "directory doesn't exist"
#fi


#AddingVagrantBox
vagrant box add $pathToImage --name=$boxName
if [[ $? -eq 0 ]]; then
    echo 'added box'
else
    echo 'Error while adding image to box'
    exit 1
fi

mkdir $boxName
if [[ $? -eq 0 ]]; then
    echo 'dir added'
else
    echo 'Error while creating directory'
    exit 1
fi
vagrant box list
cd $boxName
touch {1..10}.txt
ls
vagrant init $boxName
sleep 30

ls
#vagrant up
#vagrant ssh-config > ssh-config.txt
#ip=grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ssh-config.txt

#echo $ip
