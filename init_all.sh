#!/bin/sh

# creation du fichier known_hosts si existe pas
touch /home/vagrant/.ssh/known_hosts

# lancement de keygen si existe pas
if [ -f "/home/vagrant/.ssh/id_rsa" ]; then
   echo "La clee ssh id_rsa deja presente, pas de regeneration"
else
   echo "La clee ssh est introuvable, nouvelle generation ..."
   ssh-keygen
fi

# lancement de la config "paramiko" de Ansible
ansible-playbook -c paramiko -i hosts playbooks/ssh/setup.yml --ask-pass --sudo