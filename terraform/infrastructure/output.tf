# Output vpc_id
output "vpc_id" {
  value = module.vpc.vpc_id
}

# Output private_subnet for workspace!
output "directory_subnet_1" {
  value = module.vpc.private_subnets[0]
}

# Output private_subnet for workspace!
output "directory_subnet_2" {
  value = module.vpc.private_subnets[3]
}

# Output private_subnet for workspace!
output "workspace_subnet_1" {
  value = module.vpc.private_subnets[1]
}

# Output private_subnet for workspace!
output "workspace_subnet_2" {
  value = module.vpc.private_subnets[2]
}

# Output Public Security Group_Id 
output "security_group" {
  value = aws_security_group.public_subnet_main.id
}
