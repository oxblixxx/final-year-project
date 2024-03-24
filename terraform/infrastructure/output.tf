output "vpc_id" {
  value = module.vpc.vpc_id
}

output "directory_subnet_1" {
  value = module.vpc.private_subnets[0]
}


output "directory_subnet_2" {
  value = module.vpc.private_subnets[3]
}


output "workspace_subnet_1" {
  value = module.vpc.private_subnets[1]
}


output "workspace_subnet_2" {
  value = module.vpc.private_subnets[2]
}