Yum Proxy Repository Vagrant File (For RHEL/CentOS 7.x)
=========================================================

# What Is This

This works as your local yum proxy repository. 

The boxes which specify this box as the yum repository will fetch the package from locally, and thus no longer need to fetch the packages from the internet.

# Provisioning Repository Server

1. Edit the Vagrantfile.
  * BASE_BOX_PARALLELS   => Change to your favorite if you use parallels provider.
  * BASE_BOX_VIRTUALBOX  => Change to your favorite if you use virtualbox provider.
  * PACKAGES             => Packages to be applyed in the clients.

2. Export PROXY_PATH(case sensitive) environment variable if necessary.

3. Run "vagrant up". When completed, it will show the message like this:
  ```
  ==> default: ========================================================================
  ==> default: Yum Repository Server
  ==> default: CentOS Linux release 7.2.1511 (Core) 
  ==> default:   
  ==> default: To use this repository:
  ==> default: export YUM_URL=http://10.XXX.XXX.XXX/rpmrepo
  ==> default:   
  ==> default: To add the package, do:
  ==> default: $ ./yumupdate.sh package1 package2 ...
  ==> default: then in each yum client:
  ==> default: $ sudo yum clean all
  ==> default: ========================================================================
  ```
  
# Provisioning Yum Clients
 
1. Create a script like this:
  ``` shell
  if [ -v $YUM_URL ]; then
  echo "YUM_URL is not set ... aborting." >&2
  exit
  fi
  mkdir /etc/yum.repos.d/org
  mv /etc/yum.repos.d/CentOS* /etc/yum.repos.d/org
  cat > /etc/yum.repos.d/MyRepo.repo <<EOL
  [local-myrepository]
  name=Local
  baseurl=$YUM_URL
  gpgcheck=0
  enabled=1
  EOL
  yum clean all
  ```
  
2. Append a shell provisioner directive to Vagrantfile like this:
  ``` ini
  config.vm.provision :shell do |s|
    s.path = "YOUR_SCRIPT_NAME.sh"
    s.env = {
      :YUM_URL => ENV['YUM_URL']
      }
  end
  ```

3. Export YUM_URL shown in the console of the repository server.
4. Do "vagrant up" or "vagrant provision".

