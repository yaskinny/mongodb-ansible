source "vagrant" "mongodb" {
  communicator = "ssh"
  source_path = "ubuntu/focal64"
  provider = "virtualbox"
  add_force = true
}

build {
  source "source.vagrant.mongodb" {
    output_dir = "vagrant-iso"
    box_name = "mongo"
  }
  provisioner "ansible" {
    playbook_file = "ansible/main.yaml"
    user = "vagrant"
  }
}
