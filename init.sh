# Launch all machines needed for a kuberenetes tutorial environment
# Author: Collin O'Neill <collin@pobhox.com>

#!/bin/bash

# Variables
NEWPASSWD=ubuntu:Excretory-Overpower-Tuition6-Antiquity

# Action
multipass list

for machine in kansible1 kcontrol1 kcontrol2; do
    multipass launch --name $machine -c 1 -d 8G -m 1G;
done

for machine in kworker1 kworker2 kworker3; do
    multipass launch --name $machine -c 4 -d 30G -m 4G;
done

for machine in kansible1 kcontrol1 kcontrol2 kworker1 kworker2 kworker3; do
    echo $NEWPASSWD | multipass exec $machine -- sudo /usr/sbin/chpasswd
    multipass exec $machine -- sudo /usr/bin/sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    multipass exec $machine -- sudo /usr/bin/systemctl restart ssh;
done

multipass list
