#####################################
# yum proxy for vagrant
# (for RHEL/CentOS 7.x)
#####################################

Vagrant.configure(2) do |config|

  config.vm.provider :parallels do |p, override|
    override.vm.box = "parallels/centos-7.2" # Change This
    override.vm.box_check_update = false
  end

  config.vm.provider :virtualbox do |v, override|
    override.vm.box = "centos/7"             # Change This
    override.vm.box_check_update = false
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell" do |s|
    s.path = "mkrepo.sh"
    s.args = [  # Change This
      "java-1.7.0-openjdk",
      "gcc-c++",
      "ksh", 
      "glibc.i686"
      ]
    s.env = {:HTTP_PROXY => ENV['HTTP_PROXY'], :HTTPS_PROXY => ENV['HTTP_PROXY']}
  end

end
