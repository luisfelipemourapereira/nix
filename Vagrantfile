# frozen_string_literal: true

###############################################################################
# ubuntu 20.04
###############################################################################

# https://app.vagrantup.com/boxes/search?order=desc&page=1&provider=libvirt&q=ubuntu&sort=created&utf8=%E2%9C%93
# libvirt ubuntu

# box               = 'voegelas/geerlingguy-ubuntu2004'
# user              = :solange
# system            = :ubuntu2004
# dotfiles          = 'git@github.com:luisfelipemourapereira/dotfiles.git'
# scripts           = 'scripts'
# root_script       = "#{scripts}/entry-point.sh"
# user_script       = "#{scripts}/user-entry-point.sh"
# user_script_dest  = '/tmp/user-entry-point.sh'

Vagrant.configure('2') do |config|
  config.ssh.insert_key = false
  config.vm.box = 'esselius/nixos'
  config.vm.provision :shell, path: 'vagrant.sh'
  # config.vm.provision :shell, path: 'vagrant.sh', env: {
  #   THIS_USER: user,
  #   THIS_SHELL: 'zsh'
  # }
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '~/.ssh', '/root/.ssh', disabled: false
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = '4096'
    # rubocop:disable Metrics/LineLength
    libvirt.cpus = `awk "/^processor/ {++n} END {print n}" /proc/cpuinfo 2> /dev/null || sh -c 'sysctl hw.logicalcpu 2> /dev/null || echo ": 2"' | awk \'{print \$2}\' `.chomp
    # rubocop:enable Metrics/LineLength
  end
end
