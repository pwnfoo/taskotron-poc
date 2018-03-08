user=SiddharthVipul
image=`ls /home/$user/iso/`
echo $image
cd /home/$user/iso/
echo 'ADDING TO BOX'
vagrant box add $image --name='testCloud'
mkdir /home/$user/testCloud
cd /home/$user/testCloud

echo 'INIT TESTCLOUD'
vagrant init testCloud

echo 'VAGRANT UP'
vagrant up
vagrant ssh-config > systemInfo
echo '[atomic]' > /home/$user/hosts.ini
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' systemInfo >> /home/$user/hosts.ini
