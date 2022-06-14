pubkey = ENV['public_key']
box = ENV['box_name']

Vagrant.configure("2") do |c|
  (1..3).each do |i|
    c.vm.define "box#{i}" do |v|
      v.vm.box = box
      v.vm.box_check_update = false
      v.vm.network "public_network", bridge: "enp3s0", ip: "192.168.1.15#{i}"
      v.vm.provider "virtualbox" do |p|
        p.memory = 2048
        p.cpus = 1
        p.gui = false
      end
      v.vm.provision "shell", inline: <<-SHELL
      echo '#{pubkey}' >> /home/vagrant/.ssh/authorized_keys
      SHELL
      v.vm.hostname = "box#{i}"
    end
  end
end
