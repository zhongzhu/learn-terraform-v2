# Learn terraform docker provider v2.0
An improved version of the project [learn-terraform](https://github.com/zhongzhu/learn-terraform). In project learn-terraform, there are still several manual steps, which I hope to reduce with terraform in v2.0:

1. generate ssh key for mylinux
2. Add mylinux's public ssh key to mylinux2
3. install docker engine on mylinux2
4. Allow non-root user ubuntu to run docker commands on mylinux2

## My environment
In this project, I'll create 2 Ubuntu virtual machines on my Windows 11 Pro laptop to practice terraform.

* mylinux
    * Ubuntu 22.04
    * runs terraform
* mylinux2
    * Ubuntu 22.04
    * target machine, to be provisioned by terraform
    * docker 20.10.24

## Create virtual machines

### Install multipass
Follow the instruction on https://multipass.run/ to install multipass on Windows 11 Pro. Or just do below in Windows Terminal.

```
> winget Canonical.Multipass
```

### Create Ubuntu virtual machines
Issue below commands in Windows Terminal
```
> multipass launch -n mylinux
> multipass launch -n mylinux2
```

