# frozen_string_literal: true

###############################################################################
# ubuntu 20.04 ##############################################################################
# https://app.vagrantup.com/boxes/search?order=desc&page=1&provider=libvirt&q=ubuntu&sort=created&utf8=%E2%9C%93
# libvirt ubuntu

Vagrant.configure('2') do |config|
  config.ssh.insert_key = false
  config.vm.box = 'esselius/nixos'
  config.vm.provision 'file',
                      source: './vagrantbox/essius/nix/configuration.nix',
                      destination: 'custom-configuration.nix'
  config.vm.provision :shell, path: 'vagrant.sh'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = '4096'
    # rubocop:disable Metrics/LineLength
    libvirt.cpus = `awk "/^processor/ {++n} END {print n}" /proc/cpuinfo 2> /dev/null || sh -c 'sysctl hw.logicalcpu 2> /dev/null || echo ": 2"' | awk \'{print \$2}\' `.chomp
    # rubocop:enable Metrics/LineLength
  end
end
