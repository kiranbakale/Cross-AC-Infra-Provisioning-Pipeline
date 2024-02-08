# Cross-Account-Infra-Provisioning pipeline
 
 
This repository uses terraform to automate infrastructure provisioning in AWS account.
    
-  The following services are getting created under this Account -->
 
       - AWS S3 Bucket
       - AWS CodePipeline
       - AWS CodeBuild
       
 
 
## DEVOPS WORKFLOW
### INFRA PROVISIONING USING TERRAFORM
- Provision the necessary infrastructure resources, including
       - AWS CodePipeline
       - AWS CodeBuild
       - AWS S3 Bucket
 
- Setup the environments configs.
 
 
-  `backend.tf` - includes the configuration for storing the backend in remote-state & state locking using i.e S3 Bucket.
 
- `terraform.tfvars` - The terraform.tfvars file is a Terraform-specific configuration file used to assign values to variables defined in the project. it allows users to set values for variables, such as AWS region, instance types, or any other configurable parameters. By maintaining a separate terraform.tfvars file, users can easily update or modify variable values without altering the main Terraform configuration files.
 
- `variables.tf` - Variable definitions.
 
- After configuring the settings, apply Terraform to provision all the necessary resources.
 
 
## How To Use
 
 
**Setup the Environment:**
 
 
Use Installation guides given below to install dependencies based upon your operating system.
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 
- [ AWS CLI ](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
 
 
### Clone the repository
  - Clone the code from the repository
  ```sh
  git clone  repo-url
  ```
  - Configuring the aws credentials for dev account by using the following command
  ```sh
  aws configure
  ```
- provide access & secret key and `us-east-1` region is to be selected
 
 
## To make changes in Infra-resources.
- Open `terraform.tfvars` file  
 
1. In `terraform.tfvars` navigate  to specific resource section that has resource name labelled above it.
 
2. Under `terraform.tfvars` - All the resources are variablized & creation of resource can be controlled using `tfvars`
 
3. `terraform init` - to allow terraform download the necessary plugins to provision the resources
 
4. `terraform plan` - to verify the changes
 
5.  ` terraform apply -auto-approve` - to apply the changes
 
- Add , commit and push the latest changes
 ```sh
git add .
git commit -m "message"
git push origin master
 ```