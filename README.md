# AWS Terraform Infrastructure Project
## TO DO : 
What to build
Pick one cloud — AWS or Azure — and write a Terraform configuration that provisions a small stack consisting of:

Object/blob storage — an S3 bucket (AWS) or a Storage Account + container (Azure).
A small compute or container resource — e.g. a single EC2 instance, a Lambda function or an ECS/Container service on AWS; or on Azure an App Service, Container Instance or a small VM running a hello-world workload.
Basic networking — a VPC/VNet with at least one subnet and a security group / NSG scoping access sensibly (least privilege).
Variables and outputs — parameterize names, region/ location and sizing in variables.tf (with a sample terraform.tfvars.example); expose useful values (endpoint, public URL/IP, bucket/account name) via outputs.tf.
Remote-state guidance — include a backend block (commented out is fine) for an S3 + DynamoDB or Azure Storage backend with locking, and explain it briefly in the README. You do not need a real cloud account to be graded — a clean terraform plan and clear docs are what we review.
A README covering the design, the resources created, the terraform fmt / init / validate / plan / apply steps, how to authenticate, and a short design-notes section (trade-offs, what you would add for production) plus the declared AI-assistant usage section described below.
A GitHub Actions workflow (a YAML under .github/workflows/) that, on push/PR, runs terraform fmt -check and terraform validate.
Bonus (optional)
A reusable module, a second provider/region via a provider alias, for_each over a map of resources, a resource tagging policy, or a basic tflint step in CI.


## Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform on AWS. It provisions a modular cloud setup including networking, storage, and compute resources.

---

## Architecture Components

### 1. Networking Module
- VPC (10.0.0.0/16)
- Public Subnet (10.0.1.0/24)
- Security Group (least privilege)
  - Allows HTTP (80)
  - Allows HTTPS (443)

### 2. Storage Module
- S3 bucket for object storage

### 3. Compute Module
- AWS Lambda function (Python 3.12)
- Returns "Hello from Lambda"

---

## Project Structure

```text
aws/
│
├── backend.tf
├── providers.tf
├── variables.tf
├── main.tf
├── README.md
│
└── modules/
    ├── networking/
    │   ├── main.tf
    │   └── outputs.tf
    │
    ├── storage/
    │   ├── main.tf
    │   └── outputs.tf
    │
    └── compute/
        ├── main.tf
        ├── index.py
        ├── lambda.zip
        └── outputs.tf
```

## Prerequisites
- Terraform installed (>= 1.5)
- AWS CLI configured
- IAM permissions for VPC, S3, Lambda

## AWS Configuration
```bash
aws configure
```

## Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Validate configuration**
   ```bash
   terraform validate
   ```

3. **Plan infrastructure**
   ```bash
   terraform plan
   ```

4. **Apply infrastructure**
   ```bash
   terraform apply -auto-approve
   ```

5. **Destroy infrastructure (optional)**
   ```bash
   terraform destroy -auto-approve
   ```

## Remote State (Optional)

Terraform backend configuration (commented):

```hcl
/*
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "aws/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
*/
```

### Benefits:
- Centralized state storage
- Team collaboration
- State locking using DynamoDB

## Outputs

After deployment, Terraform outputs:
- VPC ID
- Subnet ID
- Security Group ID
- S3 Bucket Name
- Lambda Function Name

## Key Concepts Covered
- Infrastructure as Code (IaC)
- Terraform modules
- AWS core services
- Security best practices (least privilege)
- Remote state concept
- Reusable infrastructure design
