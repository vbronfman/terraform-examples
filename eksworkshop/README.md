# AWS Elastic Kubernetes Service (EKS) workshop!

[Workshop terraform ](https://www.eksworkshop.com/docs/introduction/setup/your-account/using-terraform)

## Introduction

Welcome to the AWS Elastic Kubernetes Service (EKS) workshop!

This workshop guides you through a set of hands-on lab exercises to learn and explore the various features provided by EKS and how it integrates with the broader set of services offered by AWS. The labs are grouped across a number of areas:

    Introduction - Learn the format and structure of this workshop
    Fundamentals - Familiarize yourself with basic EKS concepts such as managed node groups, Fargate, exposing your applications and utilizing storage
    Autoscaling - Understand how to automatically scale your applications and clusters horizontally and vertically
    Observability - Monitoring is a critical factor getting a workload to production
    Security - Demonstrates how to apply container security practices to EKS clusters and workloads
    Networking - Dive deep in to how EKS networking integrates to Amazon Virtual Private Cloud and more
    Automation - Apply principles such as GitOps and provisioning infrastructure through EKS

These labs are designed in a way that you can pick any combination of modules that reflect your experience and skills to learn efficiently. The workshop environment provides pre-configured AWS infrastructure including an EKS cluster and AWS Cloud9 Integrated Development Environment (IDE) with all the tools you need to complete the lab exercises.


mkdir -p ~/environment/terraform; cd ~/environment/terraform
curl --remote-name-all https://raw.githubusercontent.com/aws-samples/eks-workshop-v2/stable/cluster/terraform/{main.tf,variables.tf,providers.tf,vpc.tf,eks.tf}


terraform init
terraform apply -var="cluster_name=$EKS_CLUSTER_NAME" -auto-approve

Next delete the cluster with terraform:

cd ~/environment/terraform
terraform destroy -var="cluster_name=$EKS_CLUSTER_NAME" -auto-approve


## LAB 

[sample application](https://www.eksworkshop.com/docs/introduction/getting-started/about)
