# Automated Cloud Compliance Scanner (DevSecOps CI/CD)

This is a DevSecOps demonstration featuring automated Static Application Security Testing (SAST) for Infrastructure as Code (IaC) using Terraform, GitHub Actions, and Checkov.

## Overview
Shifting security left by integrating security scanning directly into the CI/CD deployment pipeline. This repository uses intentionally vulnerable Terraform configurations to demonstrate how automated pipelines intercept security misconfigurations before deployment.

## Features
- **Infrastructure as Code (IaC):** Terraform definitions for cloud storage and networking constructs.
- **Automated CI/CD Pipeline:** Configured via GitHub Actions to trigger scans on every commit or pull request.
- **Static Application Security Testing (SAST):** Integrates Checkov to perform static analysis against CIS Benchmarks and AWS Security Best Practices.
- **Policy Enforcement:** Pipeline fails builds containing high-severity risks (e.g., world-open SSH ports, public S3 buckets).

## Project Structure
```text
devsecops-terraform-scanner/
│
├── .github/
│   └── workflows/
│       └── compliance-scan.yml   # GitHub Actions CI/CD pipeline
├── main.tf                       # Terraform configuration (IaC)
└── README.md                     # Documentation
```
## Security Violations Caught by Pipeline
1. **CKV_AWS_20:** S3 Bucket Has Public Access Unblocked.
2. **CKV_AWS_24:** Security Group
allows SSH access (Port 22) from 0.0.0.0/0.
3. **CKV_AWS_145:** S3 Bucket lacks explicit Server-Side Encryption
(SSE) -
