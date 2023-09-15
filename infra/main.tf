terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }    
  }
}

provider "tls" {}

resource "tls_private_key" "ssh_key_pair" {
  algorithm   = "ED25519"
}

resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_pair.private_key_openssh} ubuntu@mylinux' > ~/.ssh/id_ed25519"
  }
}

resource "null_resource" "change_private_key_file_permission" {
  depends_on = [ null_resource.generate_ssh_key ]

  provisioner "local-exec" {
    command = "chmod 600 ~/.ssh/id_ed25519"
  }
}

resource "null_resource" "generate_ssh_pub_key" {
  depends_on = [ null_resource.generate_ssh_key ]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_pair.public_key_openssh}' > ~/.ssh/id_ed25519.pub"
  }
}

