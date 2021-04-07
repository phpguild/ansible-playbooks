# Ansible Playbooks

## Controller Node

### Installation

    sh -c "$(wget https://raw.githubusercontent.com/phpguild/ansible-playbooks/main/.install/controller.sh -O -)"

### Edit /etc/sudoers

    ansible ALL=(ALL)     NOPASSWD: ALL

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

## Target Node

### Installation

    sh -c "$(wget https://raw.githubusercontent.com/phpguild/ansible-playbooks/main/.install/target.sh -O -)"

### Edit /etc/sudoers

    ansible ALL=(ALL)     NOPASSWD: ALL

### Authorize Controller Node

    echo "{controller_id_rsa.pub}" >> /home/ansible/.ssh/authorized_keys

## Usage
    git clone https://github.com/dockerguild/ansible-playbooks.git
    cd ansible-playbooks
    ansible-playbook -vvv -l {target_host} -u {target_user} docker/playbook.yaml
