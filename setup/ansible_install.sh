#!/bin/bash

echo Ansible instance IP address:

read ip_addr


scp -i ~/.ssh/eng74_leo_aws_key.pem ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr:~/.ssh/eng74_leo_aws_key.pem

# copy playbooks folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r playbooks/ ubuntu@$ip_addr:/home/ubuntu/playbooks/ 
# copy app folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r code/app/ ubuntu@$ip_addr:/home/ubuntu/app/ 
# copy nginx config folder
scp -i ~/.ssh/eng74_leo_aws_key.pem -r code/nginx_config/ ubuntu@$ip_addr:/home/ubuntu/nginx_config/
# copy hosts to add file
scp -i ~/.ssh/eng74_leo_aws_key.pem hosts_to_add ubuntu@$ip_addr:/home/ubuntu/hosts_to_add
# copy ansible.cfg to add file
scp -i ~/.ssh/eng74_leo_aws_key.pem ansible.cfg ubuntu@$ip_addr:/home/ubuntu/ansible.cfg


ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr << EOF
sudo hostnamectl set-hostname ansible-controller
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# installing python 

sudo apt install python3-pip -y
pip3 install --upgrade pip

# Installing necessary packages to allow communication with AWS

pip3 install awscli
pip3 install boto
pip3 install boto3

sudo cp hosts_to_add /etc/ansible/hosts
sudo cp ansible.cfg /etc/ansible/ansible.cfg
sudo chmod 400 ~/.ssh/eng74_leo_aws_key.pem

ansible-playbook playbooks/app_playbook.yaml

ansible-playbook playbooks/db_playbook.yaml
EOF


ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr 
