provider "aws" {
  region = "ap-south-1"
    access_key = "AKIAWXTUJ4MVSESXI6IT"
    secret_key = "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"
}

resource "aws_instance" "myTestInstance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups = ["terrafrom_test_sg"]
  associate_public_ip_address = true
  user_data                   = <<-EOL
  #!/bin/bash -xe

  sudo yum update -y

  EOL

  tags = {
    "name" = "my_Test_Instance"
  }
}

output "instanceIds" {
  description = "This is linux test Instances"
  value       = aws_instance.myTestInstance.id
}

resource "aws_ami_from_instance" "example" {
  name                    = "terraform-example"
  source_instance_id      = aws_instance.myTestInstance.id
  snapshot_without_reboot = true
}

output "ami_name_from_instance" {
  description = "This is linux ami from latest instance"
  value       = aws_ami_from_instance.example.id

}
