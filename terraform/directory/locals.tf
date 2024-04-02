# Fetch VPC output data from Infrastructure state file
locals {
  vpc_id = data.terraform_remote_state.infrastructure.outputs.vpc_id
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  directory_subnet_1 = data.terraform_remote_state.infrastructure.outputs.directory_subnet_1
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  directory_subnet_2 = data.terraform_remote_state.infrastructure.outputs.directory_subnet_2
}
