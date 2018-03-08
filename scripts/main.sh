#Variable to be modified

user=SiddharthVipul
varHost=/home/$user/hosts.ini
varPathToYml=/home/$user/projects/taskotron-poc/main.yml

#Cleaning up the environment
bash remove.sh

#creating the VM and getting its IP
bash create.sh

echo "****Created, now getting ip for login****"

ip=`grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /home/$user/hosts.ini`

echo "****putting ip in login.sh****"

sed -i -e "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/${ip}/g" login.sh

echo "**** Password less login ****"
expect -f login.sh

#sshpass -p "vagrant" ssh-copy-id root@$ip

echo "**** EXECUTING PLAYBOOK ****"

ansible-playbook -i $varHost $varPathToYml > /home/$user/output.txt

bash remove.sh

