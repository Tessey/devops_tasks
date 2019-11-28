-----Ansible TASK-------

1. I use AWS, so i make Ansible instance and 2 client-instances.
2. In group_vars i placed my variables (user_name and ssh).
   Ansible.cfg points out for my variables and undo "fingerprint" for connecting.
   hosts.txt contain IP of client-instances.
   Playbook install apache,upload web page and start service.
3. With "ansible-vault encrypt name_of_file" i encrypted my hosts.txt and /group_vars/server1.yml

I choose apache instead nginx. I think it dosn`t matter which one to choose.
