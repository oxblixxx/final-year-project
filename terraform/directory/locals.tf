# Fetch VPC output data from Infrastructure state file
locals {
  vpc_id = data.terraform_remote_state.infrastructure.outputs.vpc_id
}

locals {
  bcp_vpc_id = data.terraform_remote_state.infrastructure.outputs.bcp_vpc_id
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  bcp_directory_subnet_1 = data.terraform_remote_state.infrastructure.outputs.bcp_directory_subnet_1
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  bcp_directory_subnet_2 = data.terraform_remote_state.infrastructure.outputs.bcp_directory_subnet_2
}


locals {
  directory_subnet_1 = data.terraform_remote_state.infrastructure.outputs.directory_subnet_1
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  directory_subnet_2 = data.terraform_remote_state.infrastructure.outputs.workspace_subnet_1
}
