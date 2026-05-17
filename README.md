# CloudNative Commerce Platform on AWS EKS

Production-grade cloud-native e-commerce platform deployed on AWS EKS using Terraform, Jenkins CI/CD, Docker, Kubernetes, ArgoCD GitOps, and DevSecOps practices.

---

# Project Overview

This project demonstrates an end-to-end DevOps implementation for deploying and managing a scalable e-commerce platform on Kubernetes using GitOps principles.

The infrastructure is provisioned using Terraform on AWS EKS, integrated with Jenkins CI/CD pipelines, Docker containerization, Trivy security scanning, and ArgoCD continuous delivery.

---

# Key Features

- Infrastructure as Code using Terraform
- AWS EKS Kubernetes cluster deployment
- Jenkins CI/CD pipeline automation
- Docker image build & push automation
- GitOps deployment using ArgoCD
- Kubernetes manifests for application deployment
- MongoDB StatefulSet deployment
- Horizontal Pod Autoscaling (HPA)
- DevSecOps integration with Trivy
- NGINX Ingress Controller integration
- Cert-Manager integration for TLS
- AWS VPC architecture with public/private subnets
- Kubernetes namespace isolation
- Production-grade resource configuration

---

# Tech Stack

## Cloud
- AWS
- Amazon EKS
- EC2
- VPC
- IAM
- Load Balancer

## Infrastructure as Code
- Terraform

## CI/CD
- Jenkins
- GitHub
- ArgoCD

## Containerization
- Docker

## Kubernetes
- EKS
- StatefulSets
- Deployments
- Services
- Ingress
- HPA
- ConfigMaps
- Secrets

## Security
- Trivy
- Kubernetes Secrets

---

# Architecture

```text
                    ┌────────────────────┐
                    │      GitHub        │
                    │ Source Repository  │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │      Jenkins       │
                    │  CI/CD Pipeline    │
                    └─────────┬──────────┘
                              │
             ┌────────────────┴────────────────┐
             │                                 │
             ▼                                 ▼
    ┌──────────────────┐             ┌──────────────────┐
    │ Docker Build     │             │ Trivy Security   │
    │ & Push            │             │ Scanning         │
    └─────────┬────────┘             └──────────────────┘
              │
              ▼
     ┌────────────────────┐
     │   Docker Hub       │
     │ Container Registry │
     └─────────┬──────────┘
               │
               ▼
     ┌────────────────────┐
     │      ArgoCD        │
     │   GitOps Engine    │
     └─────────┬──────────┘
               │
               ▼
     ┌────────────────────┐
     │   AWS EKS Cluster  │
     │ Kubernetes Deploy  │
     └─────────┬──────────┘
               │
     ┌─────────┴──────────┐
     ▼                    ▼
┌──────────────┐   ┌────────────────┐
│ Application  │   │ MongoDB        │
│ Deployment   │   │ StatefulSet    │
└──────────────┘   └────────────────┘
```

---

# CI/CD Workflow

```text
GitHub Commit
      │
      ▼
Jenkins Pipeline Trigger
      │
      ▼
Build Docker Images
      │
      ▼
Run Unit Tests
      │
      ▼
Trivy Security Scan
      │
      ▼
Push Images to Docker Hub
      │
      ▼
Update Kubernetes Manifests
      │
      ▼
ArgoCD Detects Git Changes
      │
      ▼
Automatic Sync to EKS
```

---

# Kubernetes Components

- Namespace
- Deployment
- StatefulSet
- Service
- ConfigMap
- Secret
- Ingress
- HPA
- PersistentVolumeClaim

---

# DevSecOps Features

- Docker image vulnerability scanning using Trivy
- Kubernetes Secret management
- Infrastructure automation with Terraform
- GitOps deployment strategy
- Automated deployment synchronization with ArgoCD

---

# Repository Structure

```text
.
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── eks.tf
│   ├── ec2.tf
│   └── variables.tf
│
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── mongodb-statefulset.yaml
│   └── hpa.yaml
│
├── Jenkinsfile
├── Dockerfile
└── README.md
```

---

# Screenshots

## AWS EKS Cluster

![AWS EKS Cluster](images/eks-cluster.png)

---

## Jenkins CI/CD Pipeline

![Jenkins Pipeline](images/jenkins-pipeline.png)

---

## ArgoCD GitOps Dashboard

![ArgoCD Dashboard](images/argocd-dashboard.png)

---

## Application UI

![Application UI](images/application-ui.png)

---

# Challenges Solved

- EKS networking and NodePort exposure
- ArgoCD GitOps synchronization
- Jenkins Docker permission management
- Terraform provider compatibility issues
- AWS LoadBalancer networking
- Kubernetes ingress troubleshooting
- Git history cleanup and repository optimization

---

# Learning Outcomes

- Production-grade Kubernetes deployment
- AWS EKS infrastructure management
- GitOps implementation using ArgoCD
- CI/CD pipeline automation
- DevSecOps practices
- Kubernetes troubleshooting
- Terraform modular infrastructure

---

# Future Improvements

- Helm chart implementation
- Prometheus & Grafana monitoring
- Loki centralized logging
- AWS ALB Ingress Controller
- External Secrets Manager
- Multi-environment deployments
- Blue-Green deployment strategy

---

# Author

## Tanuj Nimkar

GitHub:
https://github.com/TanUjNimkar




# License

This project is for educational and portfolio purposes.