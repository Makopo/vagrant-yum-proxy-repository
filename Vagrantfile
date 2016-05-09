#####################################
# Yum Proxy Repository Vagrant File
# (for RHEL/CentOS 7.x)
#####################################

# Variables - CHANGE HERE: 
# ---------------------------------------------------------
BASE_BOX_PARALLELS  = "parallels/centos-7.2"
BASE_BOX_VIRTUALBOX = "centos/7"
PACKAGES = [
      "java-1.7.0-openjdk",
      "gcc-c++",
      "ksh", 
      "glibc.i686"
      ]
# ---------------------------------------------------------

Vagrant.configure(2) do |config|

  config.vm.provider :parallels do |p, override|
    override.vm.box = BASE_BOX_PARALLELS
    override.vm.box_check_update = false
  end

  config.vm.provider :virtualbox do |v, override|
    override.vm.box = BASE_BOX_VIRTUALBOX
    override.vm.box_check_update = false
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell" do |s|
    s.path = "mkrepo.sh"
    s.args = PACKAGES
    s.env = {:http_proxy => ENV['HTTP_PROXY'], :https_proxy => ENV['HTTP_PROXY']}
  end

end
