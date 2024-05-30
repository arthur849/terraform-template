# Terraform AWS EC2 Ansible Control Node

This Terraform script provisions an AWS EC2 instance configured to serve as an Ansible Control Node.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account and credentials configureddd
- SSH key pair created and accessible

## Terraform Configuration

The script creates an EC2 instance with the following characteristics:

- **Region**: The AWS region where the instance will be deployed.
- **Instance Type**: The type of EC2 instance.
- **AMI**: The Amazon Machine Image (AMI) ID for the EC2 instance.
- **Subnet ID**: The subnet ID where the EC2 instance will be deployed.
- **Key Name**: The name of the SSH key pair to access the EC2 instance.
- **Security Group**: The security group IDs for the EC2 instance.
- **Tags**: 
  - Name: `Stormer Ansible Control Node`

## Provisioning Details

### Remote Execution Provisioner

- Updates the package list
- Installs Python 3 and pip
- Installs Ansible via pip

### Connection Configuration

- Connects via SSH using the user `ubuntu`
- Uses a private key located at the specified path
- Connection timeout set to 2 minutes

### Outputs

- **Public IP**: The public IP address of the EC2 instance YEA

## Usage

1. **Clone the repository** and navigate to the project directory:
   ```sh
   git clone <repository-url>
   cd <repository-directory>

