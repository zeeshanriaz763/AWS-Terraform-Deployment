# Provider configuration for the us-east-1 region
provider "aws" {
  region = "us-east-1"
}

# Define the SSH key pair
resource "aws_key_pair" "key_us_east_1" {
  key_name   = "my_key_pair_us_east_1"
  public_key = file("C:/Users/Yasir Laptop/.ssh/id_rsa.pub")
}

# Security group for us-east-1
resource "aws_security_group" "sec_group_us_east_1" {
  name        = "sec_group_us_east_1"
  description = "Allow inbound RDP for us-east-1"

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
module "ec2_instance_us_east_1" {
  source             = "./modules/ec2_instance"
  ami_id             = "ami-0e2c8caa4b6378d8c"
  availability_zone  = "us-east-1b"
  key_name           = aws_key_pair.key_us_east_1.key_name
  security_group_id  = aws_security_group.sec_group_us_east_1.id
  instance_name      = "EC2-Instance-1"
}

# Output public IP
output "instance_us_east_1_public_ip" {
  value = module.ec2_instance_us_east_1.public_ip
}
