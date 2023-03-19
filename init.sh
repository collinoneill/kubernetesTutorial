#!/bin/zsh
NEWPASSWD=ubuntu:Excretory-Overpower-Tuition6-Antiquity

mulitpass list
for machine in kansible1 kcontrol1 kworker1 kworker2 kworker3; do
    multipass launch --name $machine;
    multipass stop $machine;
    multipass set local.$machine.cpus=2;
    multipass set local.$machine.memory=2G;
    multipass start $machine;
    echo $NEWPASSWD | multipass exec $machine -- sudo /usr/sbin/chpasswd
    multipass exec $machine -- sudo /usr/bin/sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    multipass exec $machine -- sudo /usr/bin/systemctl restart ssh
done
multipass list
