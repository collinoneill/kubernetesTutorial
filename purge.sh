#!/bin/bash

multipass list

for machine in kansible1 kcontrol1 kworker1 kworker2 kworker3; do
    multipass stop $machine;
    multipass delete $machine;
    multipass purge;
done

multipass list

