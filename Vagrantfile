
Vagrant.configure("2") do |config|
    # Configure Vagrant Host Manager for automatic hostname resolution
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  
  
    # Define VMs
    config.vm.define "db01" do |db01|
      db01.vm.box = "eurolinux-vagrant/centos-stream-9"
      db01.vm.hostname = "db01"
      db01.vm.network "private_network", ip: "198.162.56.14"
      db01.vm.provider "virtualbox" do |vb|
        vb.memory = "600"
      end
      db01.vm.provision 'shell', path: "db.sh"
    end
  
    config.vm.define "mc01" do |mc01|
      mc01.vm.box = "eurolinux-vagrant/centos-stream-9"
      mc01.vm.hostname = "mc01"
      mc01.vm.network "private_network", ip: "198.162.56.16"
      mc01.vm.provider "virtualbox" do |vb|
        vb.memory = "600"
      end
      mc01.vm.provision 'shell', path: "memcached.sh"
    end
  
    config.vm.define "rmq01" do |rmq01|
      rmq01.vm.box = "eurolinux-vagrant/centos-stream-9"
      rmq01.vm.hostname = "rmq01"
      rmq01.vm.network "private_network", ip: "198.162.56.17"
      rmq01.vm.provider "virtualbox" do |vb|
        vb.memory = "600"
      end
      rmq01.vm.provision 'shell', path: "rabbit.sh"
    end
  
    config.vm.define "app01" do |app01|
      app01.vm.box = "eurolinux-vagrant/centos-stream-9"
      app01.vm.hostname = "app01"
      app01.vm.network "private_network", ip: "198.162.56.18"
      app01.vm.provider "virtualbox" do |vb|
        vb.memory = "600"
      end
      app01.vm.provision 'shell', path: "tomcat.sh"
    end
  
    config.vm.define "web01" do |web01|
      web01.vm.box = "ubuntu/jammy64"
      web01.vm.hostname = "web01"
      web01.vm.network "private_network", ip: "198.162.56.19"
      web01.vm.provider "virtualbox" do |vb|
        vb.memory = "800"
      end
      web01.vm.provision 'shell', path: "niginx.sh"
    end
end
  
  