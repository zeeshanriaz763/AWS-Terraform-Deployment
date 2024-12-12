Terraform Project: Multi-Region EC2 Instance Deployment
Project Description
This Terraform project provisions EC2 instances in two AWS regions: us-east-1 and ap-south-1. Each instance is created with its own SSH key pair, security group, and a specified AMI. The setup ensures secure access via RDP (port 3389).

Key Features:
EC2 instances deployed in us-east-1 and ap-south-1 regions.
Security groups configured to allow RDP access on port 3389.
Separate SSH key pairs for each region.
Configurable using modular Terraform code.

File Structure
.
├── main.tf                # Main Terraform file
├── us-east-1.tf           # Configuration for us-east-1 region
├── ap-south-1.tf          # Configuration for ap-south-1 region
├── modules/
│   └── ec2_instance/
│       ├── main.tf        # EC2 instance module
│       ├── variables.tf   # Input variables for the module
│       └── outputs.tf     # Output variables for the module
└── outputs.tf             # Output public IPs of the instances

Prerequisites
AWS CLI configured with appropriate credentials.
Terraform installed
Public key available at C:/Users/Your Laptop/.ssh/id_rsa.pub for SSH key pair creation.
Internet access to download AMI details and manage EC2 instances.

1. Initialize Terraform
Initialize the Terraform workspace to download required providers and modules:
terraform init

2. Validate the Configuration
Ensure that the Terraform configuration files are valid:
terraform validate

3. Plan the Deployment
Review the resources that will be created:
terraform plan

4. Deploy the Infrastructure
Apply the configuration to provision the resources:
terraform apply
Type yes when prompted.

5. Access Your Instances
1.Retrieve the public IPs of the instances from the output or AWS Console.
2.Use the respective SSH key pair to connect to the instances:
ssh -i "my_key_pair_us_east_1.pem" ec2-user@<us-east-1-public-ip>
ssh -i "my_key_pair_ap_south_1.pem" ec2-user@<ap-south-1-public-ip>

Outputs
After running terraform apply, you will see the public IPs of the instances:

us-east-1 Public IP: <IP_ADDRESS>
ap-south-1 Public IP: <IP_ADDRESS>

Variables
The following variables are used in the project:
ami_id	Amazon Machine Image ID for the region	(User-defined)
availability_zone	Availability zone for the EC2 instance	(User-defined)
key_name	Name of the SSH key pair	(Generated)

Security Considerations
Restrict inbound rules to specific IP addresses instead of 0.0.0.0/0 for RDP access.
Keep your private keys secure and do not share them publicly.
Monitor your AWS usage to avoid unexpected charges.

Clean Up
To destroy the infrastructure and avoid ongoing costs:
terraform destroy

