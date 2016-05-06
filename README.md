Yum Proxy Vagrant Box (For RHEL/CentOS 7.x)
====================================================

# What Is This

This works as your local yum proxy server. 
The boxes which specify this box as the yum repository will fetch the package from locally, and thus no longer need to fetch the packages from the internet.

# How To Use

1. Edit the Vagrantfile.
  * "override.vm.box" to your favorite base box, preferable the same as the yum client.
  * "config.vm.provision" -> "s.args" to the package list

2. Export PROXY_PATH(case sensitive) environment variable if necessary.

3. Run "vagrant up". When completed, it shows motd like this:

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

4. At the each server, export YUM_URL before running "vagrant up" or "vagrant provision".

