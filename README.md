# setup

This repository hosts a series of [Ansible](http://www.ansible.com/)
roles that I use to get my development machines set up. Essentially,
they are a series of pretty much OS-agnostic scripts that install all
the things I need/want for development as well as my preferred
configuration files where relevant.

The roles are divided into three groups: *simple*, *composite*, and
*personalized* roles. These three groups are found in `roles/simple`,
`roles/composite` and `roles/personalized`, respectively. Simple
roles depend on no other roles. For example `simple/tmux` installs
tmux with the package manager on your system. Composite roles, on
the other hand, are composed of other, typically simple roles. For
example, `composite/tmux-with-system-clipboard-interop` will install
tmux and the tools you need make tmux interoperate with the system
clipboard on your system. So if you run OS X, this entails installing
the `reattach-to-user-namespace` brew formula, while if you are one
some Linux or BSD running Xorg, it installs the `xclip` utility. The
personalized roles are roles that install and configure programs exactly
how *I* want them: For example, the `personalized/vim` installs vim,
downloads my personal configuration and installs it appropriately.


## How do I use it?

* Run `bootstrap-ansible.sh` to install Ansible on your system.
* Create an Ansible playbook that includes the roles you want. See
`example.yml`

* Run `ansible-playbook filename-of-playbook.yml -i default-host --ask-become-pass` to run
a playbook. If you are on FreeBSD, you have to use `ansible-playbook
filename-of-playbook.yml -i freebsd-host --ask-become-pass`. If you run
inside a Vagrant machine or have passwordless sudo in other ways, you can
drop the `--ask-become-pass`option.

## Using Vagrant to test the scripts

The `Vagrantfile` contains test configurations for Ubuntu, Debian and
FreeBSD.

To spin up a virtual machine of interest, type `vagrant up
<distroname>`, where `<distroname>` is either `ubuntu`, `freebsd` or
`debian`.

Use `vagrant ssh <distroname>` to log into the machine. You'll find
the repository in `/vagrant/`. From here you can run the ansible
scripts as if you had just acquired a fresh box.

(I am aware that you can use Ansible as a [vagrant
provisioner](https://www.vagrantup.com/docs/provisioning/ansible.html).
However, the point of this repository is to simualte that you are
setting up a local machine, including explicitly installing Ansible.)

### What about testing on OS X?

Ideally, I'd like to have a Vagrant box for OS X also. I am intrigued
by [these instructions for generating Virtualbox images for OS X](https://github.com/geerlingguy/mac-osx-virtualbox-vm), and might try it someday.

## Supported operating systems

Mac OS X is my daily driver and the only truly first-class citizen in
this setup. Nevertheless, my goal is to have a fully-scripted setup
compatible with all major unices, particularly Ubuntu, FreeBSD and
Debian. If you come across a role that is incorrectly coded for your
system, please send me a pull request!

## I am intrigued. Are there other repositories like these?

Sure! Check out [osxc](https://github.com/osxc/).
