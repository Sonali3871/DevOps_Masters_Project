# DevOps-Masters-Project

This project automates the CI/CD pipeline using AWS services and GitHub Actions. It also integrates secure Kubernetes deployments using Sealed Secrets and Terraform-managed infrastructure.

---

## 📌 Project Tasks Overview

### ✅ Task 1: AWS CodePipeline Setup using Terraform

This task automates a CI/CD pipeline using:
- **AWS CodePipeline**: Orchestrates the workflow
- **CodeBuild**: Compiles and builds source code
- **CodeDeploy**: Deploys the built artifacts
- **S3 Bucket**: Stores build artifacts
- **Terraform**: Manages infrastructure as code

#### Infrastructure Components:
- `aws_codepipeline` – Defines pipeline stages
- `aws_codebuild_project` – Builds using `buildspec.yml`
- `aws_codedeploy_deployment_group` – Deploys to EC2 instances
- `aws_iam_role` – IAM roles for CodeBuild, CodeDeploy, and CodePipeline
- `aws_s3_bucket` – Artifact bucket

> 🔐 GitHub Token and repository details are configured as Terraform variables.

#### Files Involved:
- `codepipeline.tf`
- `codebuild.tf`
- `codedeploy.tf`
- `iam.tf`
- `main.tf`, `provider.tf`, `variables.tf`, `outputs.tf`
- `buildspec.yml`, `appspec.yml`

---

### ✅ Task 2: DevSecOps Integration – EKS + GitHub Actions + Sealed Secrets

This task introduces secure Kubernetes deployments using:
- **Amazon EKS (Elastic Kubernetes Service)**: Manages Kubernetes cluster
- **Terraform EKS Module**: Provisions EKS with managed node groups
- **GitHub Actions**: Automates CI/CD to EKS
- **Sealed Secrets**: Securely stores sensitive Kubernetes secrets in GitHub

#### EKS Setup Details:
- Region: `ap-south-1`
- EKS Version: `1.29`
- Instance Type: `t3.micro` (cost-effective)
- Enabled IRSA for IAM Role for Service Accounts
- Created using Terraform official module

#### GitHub Actions Workflows (under `.github/workflows/`):
- Builds and pushes image to ECR
- Deploys app to EKS cluster using `kubectl`
- Uses sealed secrets to avoid exposing sensitive credentials

#### Folder Structure:
├── .github/workflows/
├── modules/codepipeline/
├── eks/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── buildspec.yml
├── appspec.yml
├── main.tf
├── codepipeline.tf
├── codebuild.tf
├── codedeploy.tf
├── iam.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md


---

## 🛠️ How to Use

### 1. Clone This Repository

git clone https://github.com/<your-username>/DevOps_Masters_Project.git

cd DevOps_Masters_Project

2. Configure Your AWS CLI and GitHub Token
AWS CLI must be configured (aws configure)

Provide your github_owner, github_repo, and github_token in terraform.tfvars or via command line

3. Deploy CodePipeline with Terraform
bash
Copy
Edit
terraform init
terraform apply
4. Create EKS Cluster
Move to root folder and run:

bash
Copy
Edit
terraform apply \
  -var="vpc_id=<your-vpc-id>" \
  -var='subnet_ids=["subnet-1", "subnet-2", "subnet-3"]'
5. Connect to EKS Cluster
bash
Copy
Edit
aws eks --region ap-south-1 update-kubeconfig --name devops-cluster
kubectl get nodes
🔐 Sealed Secrets (Optional but Recommended)
Install kubeseal CLI

Create a secret:

bash
Copy
Edit
kubectl create secret generic my-secret --from-literal=password=YourPassword --dry-run=client -o json | kubeseal --format yaml > sealed-secret.yaml
Commit sealed-secret.yaml to your repo

✅ Status
✅ Task 1 Completed: CodePipeline setup and build/deploy automation

✅ Task 2 Completed: EKS cluster, GitHub Actions workflow, secure secrets with Sealed Secrets
