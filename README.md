# Ansible

Ansible is an open-source
- software provisioning
- configuration management
- application-deployment tool
- intra-service orchestration
enabling **infrastructure as code**

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

