#!/bin/sh

ANSIBLE_USER="ansible"
ANSIBLE_HOME="/home/${ANSIBLE_USER}"

if ! id -u "${ANSIBLE_USER}" >/dev/null 2>&1; then
  sudo adduser "${ANSIBLE_USER}"
  visudo
fi

sudo su - "${ANSIBLE_USER}"
if [ ! -f "${ANSIBLE_HOME}/.ssh/id_rsa.pub" ]; then
  ssh-keygen -t rsa -b 4096 -C "ansible"
fi

cat "${ANSIBLE_HOME}/.ssh/id_rsa.pub"
