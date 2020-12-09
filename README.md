# Ansible

Ansible is an open-source
- software provisioning
- configuration management
- application-deployment tool
- intra-service orchestration
enabling **infrastructure as code**

**INFRASTRUCTURE AS CODE**  
- IaC is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools

Ansible is agentless, temporarily connecting remotely via SSH to do its tasks

## How Ansible Works

[Ansible is a radically simple IT automation engine](https://www.ansible.com/overview/how-ansible-works)

Designed for multi-tier deployments, Ansible models IT infrastructure by describing how all of the systems inter-relate, rather than just managing one system at a time

- Uses no agents and no additional custom security infrastructure, so it's easy to deploy
- Uses very simple language YAML

### Efficient Architecture

Ansible connects to nodes and pushes out small programs, _Ansible modules_, to them

- These programs are written to be resource models of the desired state of the system
- Ansible then executes these modules over SSH and removes them when finished
- Library of modules can reside on any machine
    - No servers, daemons, or databases required


## What is Ansible

Ansible uses code to write and describe the set up and installation process of servers

**IT Automation**

Instructions are written to automate the IT professional's work

**Configuration Management**

Consistency of all systems in the infrastructure is maintained

**Automatic Deployment**

Applications are deployed automatically on a variety of environments

- Pull Configuration Tool
    - Nodes check with the server periodically and fetch the configurations from it

- Push Configuration Tool
    - Server pushes configuration to the nodes

**Ansible is a push type configuration management tool**

## Ansible Architecture

**Playbook**

- Create instructions to define architecture of hardware
    - Configure the nodes
- Written in YAML, a language used to describe data
- Syntax starts with 3 dashes and then a list of _plays_, e.g.
```YAML
---
    -name: play 1
    hosts: webserver
    tasks:
        -name: install apache
        yum:
            name: apache
            state: present
        -name: start apache
        service:
            name: apache
            state: start
    -name: play 2
    hosts: databaseserver
    tasks:
        -name: install MySQL
        yum:
            name: MySQL
            state: present
```
- Hosts is the target for the play
- Each play has a list of tasks
    - Each element in list of tasks given a name
    - Followed by instructions to execute the task


**Inventory**

- Maintain the structure of network environment
    - Classifies nodes into groups, e.g
```
[webserver]
web1.machine
web2.machine
web3.machine

[databaseserver]
db1.machine
```
- Hostnames of the machines are specified under the node group name


### Working of Ansible

- Ansible installed on local machine with **Playbook** and **Inventory**
    - Connects to different nodes within network
    - Use secure SSH connections to connect to remote nodes
- Retrieve basic info on each server to understand how to push playbook to each server and configure the server remotely

**END GOAL IS TO HAVE ENVIRONMENTS THAT ARE CONSISTENT**

