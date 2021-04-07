# Ansible Playbooks

## Controller Node

### Install Ansible

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

### Configure Ansible

Edit `/etc/ansible/ansible.cfg`

    [defaults]
    interpreter_python = /usr/bin/python

### Configure hosts

Edit `/etc/ansible/hosts`

    [webservers]
    ip1
    ip2
    ...

### Configure user

Create user

    sudo adduser ansible

Granted user

    visudo
    ansible      ALL=(ALL)       NOPASSWD: ALL

Create SSH key

    sudo su - ansible
    ssh-keygen -t rsa -b 4096 -C "ansible"
    cat /home/ansible/.ssh/id_rsa.pub

## Target Node

### Configure user

Create user

    sudo adduser ansible

Granted user

    visudo
    ansible      ALL=(ALL)       NOPASSWD: ALL

Create SSH authorized keys

    sudo su - ansible
    cd /home/ansible
    mkdir .ssh
    touch .ssh/authorized_keys
    chmod 600 .ssh/authorized_keys

Authorize Controller Node

    echo "{controller_id_rsa.pub}" >> /home/ansible/.ssh/authorized_keys

## Usage
    git clone https://github.com/dockerguild/ansible-playbooks.git
    cd ansible-playbooks
    ansible-playbook -vvv -l {target_host} -u {target_user} docker/playbook.yaml
