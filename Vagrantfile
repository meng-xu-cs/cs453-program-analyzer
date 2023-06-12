Vagrant.configure("2") do |config|
  # box
  config.vm.box = "ubuntu/jammy64"

  # machine
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 8192
  end

  # provision
  config.vm.provision "shell" do |s|
    s.inline = <<-SHELL
      echo "hello"
    SHELL
  end
end
