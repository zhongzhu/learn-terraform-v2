# Learn terraform docker provider v2.0
An improved version of the project [learn-terraform](https://github.com/zhongzhu/learn-terraform). In project learn-terraform, there are still several manual steps, which I hope to reduce with terraform in v2.0:

1. [done] Generate ssh key pair for mylinux
2. [done] Use multipas blueprint docker to create mylinux2 so that I don't need to
    * install docker engine
    * configure non-root user to run docker
3. Add mylinux's public ssh key to mylinux2

## My environment
In this project, I'll create 2 Ubuntu virtual machines on my Windows 11 Pro laptop to practice terraform.

* mylinux
    * Ubuntu 22.04
    * runs terraform
* mylinux2
    * Ubuntu 22.04
    * docker 20.10.24
    * target machine, to be provisioned by terraform

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
> multipass launch docker -n mylinux2
```

## Let's run the code to genreate ssh key pair on mylinux
On mylinux
```
$ git clone https://github.com/zhongzhu/learn-terraform.git
$ cd learn-terraform/infra
$ terraform init
$ terraform plan
$ terraform apply
```

### Add mylinux's ssh key to mylinux2
Append the content of mylinux's `~/.ssh/id_ed25519.pub` to mylinux2's `~/.ssh/authorized_keys`.

## Let's run the code to spin up our website
On mylinux
```
$ cd learn-terraform
$ terraform init
$ terraform plan
$ terraform apply
```

Below is the execution output.

