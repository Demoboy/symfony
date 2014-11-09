##################################################
# Generated by phansible.com
##################################################
require_relative 'vagrantvars.rb'
include VagrantVars

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"
    config.vm.hostname = HOST_NAME
    config.vm.network :private_network, ip: IP_ADDRESS
    config.ssh.forward_agent = true
    config.vm.synced_folder '.', '/vagrant', nfs: true

    config.vm.define "dev", primary: true do |dev|
        dev.vm.provider :virtualbox do |v|
            v.name = HOST_NAME + " - Dev"
            host = RbConfig::CONFIG['host_os']

            # Give VM 1/4 system memory & access to all cpu cores on the host
            if host =~ /darwin/
              cpus = `sysctl -n hw.ncpu`.to_i
              # sysctl returns Bytes and we need to convert to MB
              mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
            elsif host =~ /linux/
              cpus = `nproc`.to_i
              # meminfo shows KB and we need to convert to MB
              mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
            else # sorry Windows folks, I can't help you
              cpus = 2
              mem = 1024
            end

            v.customize ["modifyvm", :id, "--memory", mem]
            v.customize ["modifyvm", :id, "--cpus", cpus]
        end

        dev.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.limit = 'all'
            ansible.extra_vars = {
                enviroment: "dev",
                servername: HOST_NAME,
                database_name: DATABASE_NAME,
                database_user: DATABASE_USER,
                database_password: DATABASE_PASSWORD,
            }
        end
    end

    config.vm.define "test", autostart: false do |test|
        test.vm.provider :virtualbox do |v|
            v.name = HOST_NAME + " - Test"
            host = RbConfig::CONFIG['host_os']

            # Give VM 1/4 system memory & access to all cpu cores on the host
            if host =~ /darwin/
              cpus = `sysctl -n hw.ncpu`.to_i
              # sysctl returns Bytes and we need to convert to MB
              mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
            elsif host =~ /linux/
              cpus = `nproc`.to_i
              # meminfo shows KB and we need to convert to MB
              mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
            else # sorry Windows folks, I can't help you
              cpus = 2
              mem = 1024
            end

            v.customize ["modifyvm", :id, "--memory", mem]
            v.customize ["modifyvm", :id, "--cpus", cpus]
        end

        test.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.limit = 'all'
            ansible.extra_vars = {
                enviroment: "dev",
                servername: HOST_NAME,
                database_name: DATABASE_NAME,
                database_user: DATABASE_USER,
                database_password: DATABASE_PASSWORD,
            }
        end
    end

    config.vm.define "prod", autostart: false do |prod|
        prod.vm.synced_folder '.', '/vagrant', type: "rsync",
            rsync__exclude: [
                ".git/",
                "vendors"
            ]

        prod.vm.provider :virtualbox do |v|
            v.name = HOST_NAME + " - Prod"
            host = RbConfig::CONFIG['host_os']

            # Give VM 1/4 system memory & access to all cpu cores on the host
            if host =~ /darwin/
              cpus = `sysctl -n hw.ncpu`.to_i
              # sysctl returns Bytes and we need to convert to MB
              mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
            elsif host =~ /linux/
              cpus = `nproc`.to_i
              # meminfo shows KB and we need to convert to MB
              mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
            else # sorry Windows folks, I can't help you
              cpus = 2
              mem = 1024
            end

            v.customize ["modifyvm", :id, "--memory", mem]
            v.customize ["modifyvm", :id, "--cpus", cpus]
        end

        prod.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.limit = 'all'
            ansible.extra_vars = {
                enviroment: "dev",
                servername: HOST_NAME,
                database_name: DATABASE_NAME,
                database_user: DATABASE_USER,
                database_password: DATABASE_PASSWORD,
            }
        end
    end
end