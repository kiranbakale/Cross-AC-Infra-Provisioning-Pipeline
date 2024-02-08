# Cross-Account-Infra-Provisioning pipeline

 
This repository uses terraform-terragrunt to automate infrastructure provisioning in AWS account uat.



## DEVOPS WORKFLOW
### INFRA PROVISIONING USING TERRAFORM
-	Provision the necessary infrastructure resources - EC2 instance

-	Setup the environments configs.

-	 `backend.tf` - includes the configuration for storing the backend in remote-state & state locking using i.e S3 Bucket.

- `terragrunt.hcl` - The terragrunt.hcl file is a Terragrunt-specific configuration file used to assign values to variables defined in the project. it allows users to set values for variables, such as AWS region, instance types, or any other configurable parameters. By maintaining a separate terragrunt.hcl file, users can easily update or modify variable values without altering the main Terraform configuration files.


-	After configuring the settings, apply Terraform to provision all the necessary resources.
## How To Use
 

**Setup the Environment:**
 

Use Installation guides given below to install dependencies based upon your operating system.
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)

- [ AWS CLI ](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


### Clone the repository
  - Clone the code from the repository
  ```sh
  git clone repo-url
  ```
  - Configuring the aws credentials for uat account by using the following command
  ```sh
  aws configure
  ```
- provide access & secret key of admin user of respective aws account that has admin permissions and `your-region-code` region is to be selected


## To make changes in Infra-resources.
- Open `terragrunt.hcl` file & click on uat folder.
 
1. In `terragrunt.hcl` under terragrunt.hcl navigate to specific resource in inputs section that has resource name labelled above it.
 
2. Under `terragrunt.hcl` - All the resources are variablized & creation of resource can be controlled using `inputs block`
 
3. `terragrunt init` - terragrunt init initializes the Terragrunt configuration, downloads the specified Terraform configurations, and sets up the backend for remote state management.
 
4. `terragrunt plan` - terragrunt plan generates and displays an execution plan based on the Terraform configurations, allowing you to review the changes that will be applied before actually applying them.
 
5.  ` terragrunt apply -auto-approve` - to apply the changes

6. Add , commit and push the latest changes

 ```sh
git add .
git commit -m "message"
git push origin master
 ```
