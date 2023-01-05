provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWXTUJ4MVSYGTMYGT"
  secret_key = "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"
}

resource "aws_instance" "myTestInstance" {
  ami             = "ami-0f9d9a251c1a44858"
  instance_type   = "t2.micro"
  key_name        = "terraform_test_key_pair"
  security_groups = ["terrafrom_test_sg"]

  user_data = <<-EOL
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