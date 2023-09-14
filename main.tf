terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }

    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.0.0"
    }    
  }
}

provider "multipass" {}

provider "docker" {
  host     = "ssh://ubuntu@mylinux2.mshome.net:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-i", "C:/ProgramData/Multipass/data/ssh-keys/id_rsa"]
}

resource "multipass_instance" "mylinux2" {
  image = "docker"
  name = "mylinux2"
}



resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}

# ED25519 key
# resource "tls_private_key" "ssh-key" {
#   algorithm = "ED25519"
# }

# output "public_key" {
#   value = format("%s %s", tls_private_key.ssh-key.public_key_openssh, "zhongzhu@mylinux")
# #   sensitive=true
# }
