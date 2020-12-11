# Ansible Setup

## Initial Setup


**hosts**

- found in ``etc/ansible/hosts``
- specify host connection details, e.g.

```
[host_a]
<HostIP> ansible_connection=ssh ansible_ssh_private_key_file=<path/to/ssh/key>
```

## Main Commands

- Ping a host
```bash
ansible <hostname> -m ping
```
- Ping all
```bash
ansible all -m ping
```

- Run commands in all machines
```
ansible <hostname> -a "command"
```


- Run commands in all machines
```
ansible all -a "command"
```

## Playbooks

**Main Structure**

- YAML Playbook files starts with 3 dashes
- Name of playbook
- Hosts in which to run playbook
- 

**Handlers**

Need to define handler


### Template and Variables

Templates are largely text based or markup languages that don't have scripting and logical capabilities like python or ruby

What we will be able to do, is interpolate variables into them, making them dynamic

- works with jinja
- interpolates using {% %} or {{}}
- good for interpolating variables for config files or HTML




### Variables

A location where we can define variables to be used and interpolated in playbooks and/or templates

- defined dynamically in YAML