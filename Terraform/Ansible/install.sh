#!/bin/bash

#ansible install
apt-add-repository ppa:ansible/ansible -y
apt update
apt install ansible -y
git clone -b petProj https://github.com/Tessey/devops_tasks.git /home/daniel_zaharchenk00/petProj

#startup playbook
mv /home/daniel_zaharchenk00/pass /home/daniel_zaharchenk00/petProj/Ansible
cd /home/daniel_zaharchenk00/petProj/Ansible
sudo ansible-playbook playbook.yml --vault-password-file pass
