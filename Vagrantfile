# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.define "debian", autostart: false do |debian|
        debian.vm.box = "debian/jessie64"
        debian.vm.box_version = "8.2.1"
        debian.vm.hostname = "debian"

        debian.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
            vb.customize ["modifyvm", :id, "--cpus", "2"]
        end
    end

    config.vm.define "freebsd", autostart: false do |freebsd|
        freebsd.vm.network :private_network, ip: "192.168.6.67"
        freebsd.vm.guest = :freebsd
        freebsd.vm.hostname = "freebsd"
        freebsd.vm.synced_folder ".", "/vagrant", id: "vagrant-root", nfs: true
        freebsd.vm.box = "freebsd/FreeBSD-10.2-STABLE"
        freebsd.ssh.shell = "sh"
        freebsd.vm.base_mac = "080027D14C66"
        freebsd.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
            vb.customize ["modifyvm", :id, "--cpus", "2"]
            vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
            vb.customize ["modifyvm", :id, "--audio", "none"]
            vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
            vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
        end
    end

    config.vm.define "ubuntu", autostart: false do |ubuntu|
        ubuntu.vm.box = "ubuntu/wily64"
        ubuntu.vm.hostname = "ubuntu"

        ubuntu.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
            vb.customize ["modifyvm", :id, "--cpus", "2"]
        end
    end
end
