#!/bin/bash
ssh-keyscan 34.89.221.181 >> 'C:\Users\Tessey\.ssh\known_hosts'
ssh -i 'C:\Users\Tessey\.ssh\petProj' daniel_zaharchenk00@34.89.221.181 <<EOF
 cd /home/daniel_zaharchenk00/petProj/Ansible
 cd backup/GitLab
 sudo ansible-playbook git_backup.yml -i /home/daniel_zaharchenk00/petProj/Ansible/inventory.txt --vault-password-file /home/daniel_zaharchenk00/petProj/Ansible/pass

 cd -
 cd backup/Jenkins
 sudo ansible-playbook jenkins-backup.yml -i /home/daniel_zaharchenk00/petProj/Ansible/inventory.txt --vault-password-file /home/daniel_zaharchenk00/petProj/Ansible/pass
EOF

cd Ansible
terraform destroy -auto-approve
cd ../GitLab
terraform destroy -auto-approve
cd ../WebServer
terraform destroy -auto-approve
#sleep 30
cd ../Jenkins
terraform destroy -auto-approve
cd ../
