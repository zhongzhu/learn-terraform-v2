terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }    
  }
}

provider "tls" {}

# output "public_key" {
#   value = format("%s %s", tls_private_key.ssh-key.public_key_openssh, "zhongzhu@mylinux")
# #   sensitive=true
# }


resource "tls_private_key" "ssh_key_pair" {
  algorithm   = "ED25519"
}

resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_pair.private_key_openssh}' > ~/.ssh/id_ed25519"
  }
}

resource "null_resource" "generate_ssh_pub_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_pair.public_key_openssh}' > ~/.ssh/id_ed25519.pub"
  }
}

