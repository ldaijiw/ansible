#!/bin/bash

echo Ansible instance IP address:

read ip_addr

ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr << EOF



sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# installing python 

sudo apt install python3-pip -y
pip3 install --upgrade pip

# Installing necessary packages to allow communication with AWS

pip3 install awscli -y
pip3 install boto -y
pip3 install boto3 -y

EOF

scp -i ~/.ssh/eng74_leo_aws_key.pem -r playbooks/ ubuntu@$ip_addr:/playbooks/ 

ssh -i ~/.ssh/eng74_leo_aws_key.pem ubuntu@$ip_addr 
