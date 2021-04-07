#!/bin/sh

ANSIBLE_USER="ansible"
ANSIBLE_HOME="/home/${ANSIBLE_USER}"

if ! id -u "${ANSIBLE_USER}" >/dev/null 2>&1; then
  sudo adduser "${ANSIBLE_USER}"
  sudo sh -c "export EDITOR=vim; visudo"
fi

sudo su - "${ANSIBLE_USER}"
if [ ! -f "${ANSIBLE_HOME}/.ssh/authorized_keys" ]; then
  mkdir "${ANSIBLE_HOME}/.ssh"
  touch "${ANSIBLE_HOME}/.ssh/authorized_keys"
  chmod 600 "${ANSIBLE_HOME}/.ssh/authorized_keys"
fi
