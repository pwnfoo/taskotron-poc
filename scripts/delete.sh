user=SiddharthVipul

echo 'HALTING ALL THE MACHINES'

for i in `vagrant global-status | grep libvirt | awk '{ print $1 }'` ; do vagrant halt $i ; done

echo 'DESTROYING ALL THE MACHINES'

for i in `vagrant global-status | grep libvirt | awk '{ print $1 }'` ; do vagrant destroy $i ; done

echo 'REMOVING THE MACHINES FROM BOX'
vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f

echo 'I GUESS CLEARING THE BUFFER'
vagrant global-status --prune

for i in `virsh list --all | grep testCloud | awk '{ print $2 }'`; do virsh destroy $i; done
for i in `virsh list --all | grep testCloud | awk '{ print $2 }'`; do virsh undefine $i; done

rm -f /var/lib/libvirt/images/*testCloud*
if [ -d /home/$user/testCloud ]; then
    rm -rf /home/$user/testCloud 2>/dev/null
fi
systemctl restart libvirtd
