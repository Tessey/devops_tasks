#!/bin/bash

cd GitLab
terraform init
terraform apply -auto-approve

cd ../Jenkins
terraform init
terraform apply -auto-approve

cd ../WebServer
terraform init
terraform apply -auto-approve

cd ../Ansible
terraform init
terraform apply -auto-approve
