# Kubernetes on Multipass using Ubuntu Tutorial

## What 

These scripts will create a basic kubernetes environment using multipass. This script was tested on Linux and Ubuntu Linux. The latest Ubuntu image is launched. As of 
today, this is Ubuntu 22.04 LTS Jammy. 

The environment is set up in two steps. 
- Initialize the virtual machines
- Install ansible environment on the first machine
- Use ansible to configure the remaining environment

Note: we should probably remove kansible1, instead run ansible from the root machine. Additional requirement will be a running ansible application.

Five machines are created:
- kansible1
  - A machine that will run ansible scripts. An alternative is to run ansible directly from your local machine by switching to the kubernetes-env folder and running 
the playbooks there.
- kcontrol1
  - A kubernetes controller, running kubeadm
- kworker1
  - The first kubernetes worker, running kubelet
- kworker2
  - The second kubernetes worker, running kubelet
- kworker3
  - The third kubernetes worker, running kubelet

## Requirements

- Multipass [Install, upgrade or uninstall Multipass|https://multipass.run/docs/how-to-guides#heading--install-multipass-]
- sudo access to multipass 
  - [Sudo on Linux|https://www.howtogeek.com/447906/how-to-control-sudo-access-on-linux/]

## Usage

### To initialize multipass virtual machines

init.sh [supersecretpassword]

### To purge multipass virtual machines

run purge.sh
