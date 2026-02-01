# AWS EKS Terraform CI/CD Demo

This project demonstrates how to build a complete DevOps workflow on Amazon Web Services (AWS). You will use Terraform to provision an Amazon EKS (Elastic Kubernetes Service) cluster and AWS CI/CD tools (CodePipeline and CodeBuild) to automate the build, test and deployment of a containerised Node.js application.

## Architecture overview

- **Infrastructure as Code:** Terraform defines the AWS resources required for the Kubernetes cluster. It uses the community‑maintained `terraform‑aws‑modules/eks/aws` module to create an EKS cluster, node group and supporting networking. Organising variables and outputs follows recommended best practices for Terraform projects【963479772441635†L173-L183】.
- **Application:** A simple Node.js web service (`app/app.js`) exposes a REST endpoint and is packaged in a Docker image.
- **Continuous Integration:** AWS CodeBuild compiles the Node.js code and builds a Docker image. Builds run in isolated containers and scale automatically【646294489557417†L339-L347】.
- **Continuous Delivery:** AWS CodePipeline orchestrates the end‑to‑end workflow, pulling code from GitHub, triggering CodeBuild and, optionally, deploying via CodeDeploy. CodePipeline automates the release process from source to deployment and integrates with services such as GitHub and CodeBuild【646294489557417†L302-L333】.
- **Deployment:** The resulting Docker image can be pushed to Amazon Elastic Container Registry (ECR) and deployed to the EKS cluster using Kubernetes manifests or Helm charts.

## Repository structure

```
aws-eks-terraform-cicd/
├── app/                # Node.js application source code
│   ├── app.js
│   ├── package.json
│   └── Dockerfile
├── pipeline/
│   └── buildspec.yml   # Sample AWS CodeBuild specification
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md           # Project documentation (this file)
```

## Getting started

1. **Clone the repository** and install the prerequisites:
   - Terraform ≥ 1.0
   - AWS CLI configured with sufficient permissions
   - Docker and `kubectl`
2. **Provision infrastructure** by running `terraform init` and `terraform apply` in the `terraform/` directory. This creates the EKS cluster and node group.
3. **Build the application image** using the `buildspec.yml` file. You can run it locally (`docker build`) or via CodeBuild.
4. **Deploy to EKS**: tag and push the image to ECR, then apply Kubernetes manifests (not included) to deploy the container to the cluster.
5. **Set up CodePipeline** in the AWS console. Use GitHub as the source provider, configure CodeBuild with the provided `buildspec.yml`, and add deployment stages. CodePipeline will then automate builds and deployments whenever code is pushed【646294489557417†L314-L333】.

This project serves as a solid starting point for demonstrating AWS DevOps skills on your résumé. Adjust variables, add Kubernetes manifests and extend the pipeline configuration as needed.