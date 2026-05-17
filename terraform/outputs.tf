output "region" {
  value = local.region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "eks_node_public_ips" {
  value = data.aws_instances.eks_nodes.public_ips
}