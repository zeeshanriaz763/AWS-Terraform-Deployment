# AWS-Terraform-Deployment
Terraform Project: Multi-Region EC2 Instance Deployment
Project Description
This Terraform project provisions EC2 instances in two AWS regions: us-east-1 and ap-south-1. Each instance is created with its own SSH key pair, security group, and a specified AMI. The setup ensures secure access via RDP (port 3389).

Key Features:
EC2 instances deployed in us-east-1 and ap-south-1 regions.
Security groups configured to allow RDP access on port 3389.
Separate SSH key pairs for each region.
Configurable using modular Terraform code.
File Structure
graphql
Copy code
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
Terraform installed (Installation Guide).
Public key available at C:/Users/Yasir Laptop/.ssh/id_rsa.pub for SSH key pair creation.
Internet access to download AMI details and manage EC2 instances.
How to Use
1. Clone the Repository
bash
Copy code
git clone <repository-url>
cd <repository-directory>
2. Initialize Terraform
Initialize the Terraform workspace to download required providers and modules:

bash
Copy code
terraform init
3. Validate the Configuration
Ensure that the Terraform configuration files are valid:

bash
Copy code
terraform validate
4. Plan the Deployment
Review the resources that will be created:

bash
Copy code
terraform plan
5. Deploy the Infrastructure
Apply the configuration to provision the resources:

bash
Copy code
terraform apply
Type yes when prompted.

6. Access Your Instances
Retrieve the public IPs of the instances from the output or AWS Console.
Use the respective SSH key pair to connect to the instances:
bash
Copy code
ssh -i "my_key_pair_us_east_1.pem" ec2-user@<us-east-1-public-ip>
bash
Copy code
ssh -i "my_key_pair_ap_south_1.pem" ec2-user@<ap-south-1-public-ip>
For RDP access, connect to the instance using an RDP client and the public IP.
Outputs
After running terraform apply, you will see the public IPs of the instances:

us-east-1 Public IP: <IP_ADDRESS>
ap-south-1 Public IP: <IP_ADDRESS>
Variables
The following variables are used in the project:

Variable	Description	Default Value
ami_id	Amazon Machine Image ID for the region	(User-defined)
availability_zone	Availability zone for the EC2 instance	(User-defined)
key_name	Name of the SSH key pair	(Generated)
Security Considerations
Restrict inbound rules to specific IP addresses instead of 0.0.0.0/0 for RDP access.
Keep your private keys secure and do not share them publicly.
Monitor your AWS usage to avoid unexpected charges.
Clean Up
To destroy the infrastructure and avoid ongoing costs:

bash
Copy code
terraform destroy
Type yes when prompted.

References
Terraform AWS Provider
EC2 Instance Connect
Security Group Rules
Feel free to customize this README as per your project’s specific details! Let me know if you need further assistance.







