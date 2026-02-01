variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "devops-eks-demo"
}

variable "cluster_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster is deployed"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "List of subnets for EKS worker nodes"
  type        = list(string)
  default     = []
}