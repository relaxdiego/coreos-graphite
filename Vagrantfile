Vagrant.configure("2") do |config|
  config.vm.box = "coreos"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant.box"

  # Graphite web UI port
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  
  # carbon-cache line receiver
  config.vm.network "forwarded_port", guest: 2003, host: 2003
  
  # carbon-cache pickle receiver
  config.vm.network "forwarded_port", guest: 2004, host: 2004
  
  # carbon-cache query port (usually only used by the web interface)
  config.vm.network "forwarded_port", guest: 7002, host: 7002
    
  config.vm.network "private_network", ip: "172.12.8.150"
  config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']  


  config.vm.provision 'shell', path: 'vagrant/provision.sh'
end
