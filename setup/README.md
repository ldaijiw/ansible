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
