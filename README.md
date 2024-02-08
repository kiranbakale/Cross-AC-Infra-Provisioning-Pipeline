# Cross-Account-Infra-Provisioning pipeline

<p align="center">
  <img src ="https://img.shields.io/badge/Terraform-412991.svg?style&logo=Terraform&logoColor=white"/>
  <img src ="https://img.shields.io/badge/Git-F05032.svg?style&logo=git&logoColor=white"/>
  <img src ="https://img.shields.io/badge/Terragrunt-375EAB.svg?style&logo=Terragrunt&logoColor=white"/>
  <img src ="https://img.shields.io/badge/Amazon_AWS-FFA500.svg?style&logo=amazonaws&logoColor=white" size = 40px/>

![AWS](https://github.com/kiranbakale/Cross-AC-Infra-Provisioning-Pipeline/assets/46279617/281b12f4-703a-4bb0-9764-cfd70009890c)


## Contributors
Thanks to the contributors without them this project seemed next to impossible!

- @mfarhansayed
- @Ashish-sarawad
- @Phaninder-Sangers

This repository uses `terraform-terragrunt` to automate infrastructure provisioning in AWS account.

 Description

If you are interested in deploying this setup, follow the detailed step-by-step guide in this <a href="https://medium.com/@kiranbakale9/cross-account-infra-provisioning-pipeline-5a4c3feef052">Medium Article</a>

## How To Use
 

**Setup the Environment:**
 

Use Installation guides given below to install dependencies based upon your operating system.
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)

- [ AWS CLI ](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


### Clone the repository
  - Clone the code from the repository
  ```sh
  git clone https://github.com/kiranbakale/Cross-AC-Infra-Provisioning-Pipeline 
  ```
  - Configuring the aws credentials for dev account by using the following command
  ```sh
  aws configure
  ```
- provide access & secret key of respective user of dev-account and `any region` of your choice is to be selected
  
</p>  
 



## DEVOPS WORKFLOW
### PIPELINE-INFRA-PROVISIONING USING TERRAFORM - DEV ACCOUNT
- The main infra provisioning pipeline will be created in the Primary-Account i.e Dev Account and pipeline will operate from this account

-	Firstly, Navigate to the `CI/CD` folder & make changes in TF_scripts accordingly to Provision the necessary infrastructure resources that will be used to create the CI/CD Pipeline.

-	Setup the environments configs - aws credentials.

-	 `backend.tf` - includes the configuration for storing the backend in remote-state & state locking using i.e S3 Bucket - make the necessary changes mentioned in the file.

- `terraform.tfvars` - The terraform.tfvars file is a Terraform-specific configuration file used to assign values to variables defined in the project. it allows users to set values for variables, such as AWS region, instance types, or any other configurable parameters. By maintaining a separate terraform.tfvars file, users can easily update or modify variable values without altering the main Terraform configuration files by typing the following commands.


-	After configuring the settings, apply Terraform to provision all the necessary resources.


## To make changes in Infra-resources - Prod or UAT Account.
- Navigate to `TF-files` folder to add any new resources to be provisioned in the account and also dont forget to add variables accordingly.

1. Open `terragrunt.hcl` file in the environments folder and click on required folder.
 
2. In `terragrunt.hcl` under terragrunt.hcl navigate to specific resource in inputs section that has resource name labelled above it.
 
3. Under `terragrunt.hcl` - All the resources are variablized & creation of resource can be controlled using `inputs block`
4. For a fully fledged explanation and If you are interested in deploying this setup, follow the detailed step-by-step guide in this <a href="https://medium.com/@kiranbakale9/cross-account-infra-provisioning-pipeline-5a4c3feef052">Medium Article</a> This repository serves as a blueprint for implementing a Cross-A/C-Infra-Provisioning-Pipeline, promoting automation and efficiency in the software delivery process. Feel free to customize and extend it based on your specific project needs.
