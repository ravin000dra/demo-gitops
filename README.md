# Kubernetes CI/CD Pipeline Demo

This repository demonstrates a CI/CD pipeline with Kubernetes using GitHub Actions. It includes:
- Dockerfile for containerizing the app.
- Kubernetes deployment files for Dev, Test, and Prod environments.
- Terraform scripts to set up the infrastructure in Azure.
- GitHub Actions workflow for CI/CD pipeline.

## How to Run
1. Set up the infrastructure using Terraform: `terraform apply`
2. Configure GitHub Secrets for Kubernetes credentials.
3. Push code to the main branch to trigger the CI/CD pipeline.
4. Monitor the pipeline status in GitHub Actions.

## Kubernetes Deployments
- Development Environment: `k8s/deployment-dev.yaml`
- Testing Environment: `k8s/deployment-test.yaml`
- Production Environment: `k8s/deployment-prod.yaml`
