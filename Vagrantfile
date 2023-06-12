Vagrant.configure("2") do |config|
  # box
  config.vm.box = "ubuntu/jammy64"

  # machine
  config.vm.provider "virtualbox" do |v|
    v.cpus = 4
    v.memory = 16384
  end

  # provision
  config.vm.provision "shell" do |s|
    s.inline = <<-SHELL
      set -e

      # preparation
      apt-get update
      apt-get install -y \
        curl git build-essential automake cmake python3-dev
      mkdir deps

      # install: docker
      curl -fsSL https://get.docker.com | sh
      usermod -aG docker vagrant

      # build: afl++
      git clone https://github.com/AFLplusplus/AFLplusplus.git deps/AFLplusplus
      cd deps/AFLplusplus
      git checkout 4.07c
      docker build -t afl .
      cd -

      # build: klee
      git clone https://github.com/klee/klee.git deps/klee
      cd deps/klee
      git checkout v3.0
      docker build -t klee .
      cd -

      # build: symcc
      git clone https://github.com/eurecom-s3/symcc.git deps/symcc
      cd deps/symcc
      git checkout 77bb971
      git submodule init
      git submodule update
      docker build -t symcc .
      docker run symcc \
        bash -c "apt-get update -y && apt-get install -y screen"
      cd -

      # all set!
      echo "==== END OF PROVISON ==="
    SHELL
  end

  config.vm.provision "file", source: "workdir", destination: "/home/vagrant/"
end
