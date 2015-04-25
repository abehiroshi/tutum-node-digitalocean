# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.vm.hostname          = ENV["DIGITALOCEAN_HOST_NAME"]
    override.vm.box               = "digital_ocean"
    override.vm.box_url           = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.ssh.private_key_path = "~/.ssh/vagrant.rsa"
    override.ssh.username         = "vagrant"

    provider.token                = ENV["DIGITALOCEAN_TOKEN"]
    provider.ssh_key_name         = ENV["DIGITALOCEAN_SSH_KEY_NAME"]
    provider.image                = ENV["DIGITALOCEAN_IMAGE"]
    provider.region               = ENV["DIGITALOCEAN_REGION"]
    provider.size                 = ENV["DIGITALOCEAN_SIZE"] # 512MB | 1GB | 2GB | 4GB | 8GB | 16GB
    provider.setup                = true

    override.vm.synced_folder "./", "/vagrant", disabled: true
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y python-pip
    sudo pip install tutum

    echo "[auth]"                            > ~/.tutum
    echo "user = #{ENV['TUTUM_USER']}"      >> ~/.tutum
    echo "apikey = #{ENV['TUTUM_API_KEY']}" >> ~/.tutum

    tutum node byo | grep curl | sh
  SHELL
end
