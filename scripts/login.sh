spawn ssh-copy-id root@192.168.121.151
expect "Are you sure you want to continue connecting (yes/no)? "
send "yes\n"
expect "password:"
send "vagrant\n"
expect eof
