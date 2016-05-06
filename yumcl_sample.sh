#!/bin/sh
################################################
# yum Client Sample
# (for RHEL/CentOS 7.x)
#
# [Vagrantfile]
#   config.vm.provision :shell do |s|
#     s.path = "yum_sample.sh"
#     s.env = {
#       :YUM_URL => ENV['YUM_URL']
#       }
#   end
################################################

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
