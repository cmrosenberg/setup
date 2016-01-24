#!/bin/sh

if uname -a | grep "Darwin" > /dev/null; then

     sudo easy_install pip
     sudo pip install ansible

elif uname -a | grep "Debian" > /dev/null; then

    sudo apt-get install -y python-pip python-yaml python-jinja2 python-httplib2 python-paramiko python-pkg-resources git python-setuptools
    sudo easy_install pip
    sudo apt-get install -y build-essential
    sudo apt-get install -y python-all-dev python-mysqldb sshpass
    sudo pip install pyrax pysphere boto passlib dnspython
    sudo apt-get install -y bzip2 file findutils git gzip mercurial procps subversion sudo tar debianutils unzip xz-utils zip python-selinux
    sudo mkdir /etc/ansible
    sudo pip install ansible

elif uname -a | grep "FreeBSD" > /dev/null; then

    sudo pkg install ansible

elif uname -a | grep "ubuntu" > /dev/null; then

    sudo apt-get install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update -y
    sudo apt-get install ansible -y

fi
