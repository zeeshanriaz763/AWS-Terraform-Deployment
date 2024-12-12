# Provider configuration for the ap-south-1 region
provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

# Define the SSH key pair
resource "aws_key_pair" "key_ap_south_1" {
  provider   = aws.ap-south-1
  key_name   = "my_key_pair_ap_south_1"
  public_key = file("C:/Users/Yasir Laptop/.ssh/id_rsa.pub")
}

# Security group for ap-south-1
resource "aws_security_group" "sec_group_ap_south_1" {
  provider    = aws.ap-south-1
  name        = "sec_group_ap_south_1"
  description = "Allow inbound RDP for ap-south-1"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance module
module "ec2_instance_ap_south_1" {
  source             = "./modules/ec2_instance"
  providers          = {
    aws = aws.ap-south-1
  }
  ami_id             = "ami-036841078a4b68e14"
  availability_zone  = "ap-south-1a"
  key_name           = aws_key_pair.key_ap_south_1.key_name
  security_group_id  = aws_security_group.sec_group_ap_south_1.id
  instance_name      = "EC2-Instance-2"
}

# Output public IP
output "instance_ap_south_1_public_ip" {
  value = module.ec2_instance_ap_south_1.public_ip
}
