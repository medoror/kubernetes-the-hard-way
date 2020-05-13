# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-testing64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.memory = "1024"
    vb.customize ['setextradata', :id, 'GUI/ScaleFactor', '2']
  end

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get -y upgrade
    apt-get install -y \
      build-essential \
      curl \
      wget \
      apt-transport-https \
      ca-certificates \
      gnupg \
      tmux \
      vim

    modprobe veth

    sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=10/' /etc/default/grub
    update-grub

    # cfssl and cfssljson
    wget -q --show-progress --https-only --timestamping \
    https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssl \
    https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssljson

    chmod +x cfssl cfssljson

    sudo mv cfssl cfssljson /usr/local/bin/
 
    # kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.3/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/

    # gcloud console
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk
  SHELL
end

