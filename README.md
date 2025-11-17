# 🚀 AWS Enterprise IaC: Multi-Account, Secure, and Compliant Terraform Deployment

This repository implements a production-grade, multi-account Infrastructure as Code (IaC) framework using **Terraform** and **GitHub Actions**. It is designed for organizations deploying to **multiple AWS environments** (dev, stage, prod) with a focus on:

- ✅ Security (encryption, subnet isolation, IAM policies)
- ✅ High availability (multi-AZ, modular VPC)
- ✅ Compliance (BDD-style policy enforcement)
- ✅ CI/CD automation (GitHub Actions with matrix strategy)
- ✅ Auditability and scalability

---

## 🧱 Architecture Overview

aws-enterprise-iac/
├── infrastructure/
│   ├── dev/         # Dev environment IaC (main.tf, dev.tfvars, backend.tf)
│   ├── stage/       # Stage environment IaC (main.tf, stage.tfvars, backend.tf)
│   └── prod/        # Prod environment IaC (main.tf, prod.tfvars, backend.tf)
│
├── modules/
│   ├── vpc/         # Reusable VPC module (public/private subnets, IGW, NAT, tagging)
│   └── ec2/         # Reusable EC2/ASG/LaunchTemplate module
│
├── features/        # terraform-compliance BDD policy features (e.g., sg, encryption, tags)
│
├── policies/        # IAM policy JSONs (e.g., for CI/CD to SecretsManager)
│
└── .github/
    └── workflows/   # GitHub Actions pipeline definitions (terraform-cicd.yml)



---

## 🌍 Multi-Account Strategy

Each environment (`dev`, `stage`, `prod`) is isolated with:

- Separate Terraform state (via S3 + DynamoDB)
- Dedicated AWS credentials (via GitHub Secrets)
- Independent variable files (`*.tfvars`)
- Environment-specific backend configuration

> 🔐 Secrets are stored securely in GitHub Actions and mapped dynamically using matrix strategy.

---

## 🔁 CI/CD Pipeline (GitHub Actions)

The pipeline uses a **matrix strategy** to deploy across all environments in parallel:

- Validates Terraform syntax
- Runs `terraform plan` for each environment
- Applies changes with manual approval (optional)
- Supports drift detection and compliance scanning (extendable)

> 📂 See [.github/workflows/terraform-cicd.yml](.github/workflows/terraform-cicd.yml)

---

## 🔐 Security & Compliance

| Feature                     | Implementation                                      |
|----------------------------|-----------------------------------------------------|
| Public/private subnet split| VPC module with AZ-aware subnet provisioning        |
| Encryption at-rest         | S3 bucket encryption, encrypted Terraform state     |
| Encryption in-transit      | TLS enforced via ALB and security group rules       |
| IAM least privilege        | Scoped SecretsManager policy for CI/CD             |
| Compliance-as-code         | `terraform-compliance` with BDD policies            |

> 📁 See [features/](features/) and [policies/](policies/) for examples

---

## 🧩 Modular Design

Modules are reusable and environment-agnostic:

- `vpc`: CIDR, subnets, AZs, IGW
- `ec2`: AMI, instance type, subnet, SG

> 📁 See [modules/](modules/) for reusable components

---

## 🧪 How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/<your-org>/aws-enterprise-iac.git
   cd aws-enterprise-iac


   