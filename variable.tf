variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     = "terraform_pem_jenkins"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "terrafrom_test_sg"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "test-jenkins-terraform"
}
variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0f9d9a251c1a44858"
}


# variable "vpc-cidr" {
#   default     = "10.0.0.0/16"
#   description = "VPC CIDR BLOCK"
#   type        = string
# }
# variable "Public_Subnet_1" {
#   default     = "10.0.0.0/24"
#   description = "Public_Subnet_1"
#   type        = string
# }
# variable "Private_Subnet_1" {
#   default     = "10.0.2.0/24"
#   description = "Private_Subnet_1"
#   type        = string
# }