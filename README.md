# Jenkins Server Terraform Configuration
This Terraform configuration sets up a Jenkins server on AWS using modular components. It utilizes several modules from the [devops-terraform-aws](https://github.com/devops-terraform-aws) organization to create an [EC2 Instance](https://github.com/devops-terraform-aws/ec2-instance-module), [Security Group](https://github.com/devops-terraform-aws/security-group-module), [Random Name](https://github.com/devops-terraform-aws/random-module), and [SSH Key](https://github.com/devops-terraform-aws/ssh-key-module).

### Prerequisites
Make sure you have the following prerequisites before deploying the Jenkins server:

-   `AWS CLI` configured with necessary credentials
-   `Terraform` installed on your local machine
-   `Git` installed on your local machine

## Usage

1. Clone this repository:
```
git clone https://github.com/devops-terraform-aws/jenkins.git
cd jenkins
```

2. Initialize Terraform:
```
terraform init
```

3. Review and modify the terraform.tfvars file to customize your deployment parameters.

4. Apply the Terraform configuration:
```
terraform apply
```

Confirm by typing `yes` when prompted.

Once the deployment is complete, Terraform will output the Jenkins server's public IP address.

## Terraform Modules 

### Jenkins Module 
This module [EC2 Instance](https://github.com/devops-terraform-aws/ec2-instance-module) is responsible for creating the Jenkins EC2 instance.

`Source`: [EC2 Instance](https://github.com/devops-terraform-aws/ec2-instance-module)
### Input Parameters:
`ami`: ID of the Ubuntu 20.04 AMI. <br>
`key_name`: SSH key name for the instance. <br>
`instance_type`: EC2 instance type. <br>
`name`: Name tag for the instance. <br>
`user_data`: User data script for Jenkins installation. <br>
`security_groups`: List of security group names. <br>
`region`: AWS region.

### Security Group Module
This module, [Security Group](https://github.com/devops-terraform-aws/security-group-module), creates a security group for the Jenkins server. <br>
#### Input Parameters:
`name`: Name tag for the security group.<br>
`cidr_blocks`: List of CIDR blocks to allow traffic. <br><br>
### Unique Name Module
This module, [Random Name](https://github.com/devops-terraform-aws/random-module), generates a unique name for resources.
Source: devops-terraform-aws/random-module

### AWS Key Module
This module, [SSH Key](https://github.com/devops-terraform-aws/ssh-key-module), creates an SSH key pair.

#### Input Parameters:
`key_name`: Name of the SSH key pair.

### Null Resource for Key Generation
This null resource runs a local-exec provisioner to generate and save the private key locally.

### Cleanup
To destroy the Jenkins server and associated resources, run:
```
terraform destroy
```
Confirm by typing `yes` when prompted.