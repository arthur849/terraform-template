# terraform-template
# Terraform AWS EC2 Ansible Control Node

This Terraform script provisions an AWS EC2 instance configured to serve as an Ansible Control Node.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account and credentials configured
- SSH key pair created and accessible

## Terraform Configuration

The script creates an EC2 instance with the following characteristics:

- **Region**: `ap-south-1`
- **Instance Type**: `t2.micro`
- **AMI**: `ami-0cc9838aa7ab1dce7` (Ubuntu 18.04 LTS in this example, change to your desired AMI ID)
- **Subnet ID**: `subnet-03f39704c040dac27`
- **Key Name**: `arthur-stormer`
- **Security Group**: `sg-040e94be33ddc6dd5`
- **Tags**: 
  - Name: `Stormer Ansible Control Node`

## Provisioning Details

### Remote Execution Provisioner

- Updates the package list
- Installs Python 3 and pip
- Installs Ansible via pip

### Connection Configuration

- Connects via SSH using the user `ubuntu`
- Uses a private key located at `/usr/local/bin/teraform-project/arthur.pem`
- Connection timeout set to 2 minutes

### Outputs

- **Public IP**: The public IP address of the EC2 instance

## Usage

1. **Clone the repository** and navigate to the project directory:
   ```sh
   git clone <repository-url>
   cd <repository-directory>

