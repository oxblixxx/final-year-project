locals {
  directory_id = data.terraform_remote_state.directory.outputs.directory_id
}

locals {
  workspace_subnet_1 = data.terraform_remote_state.infra.outputs.workspace_subnet_1
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  workspace_subnet_2 = data.terraform_remote_state.infra.outputs.workspace_subnet_2
}

locals {
  security_group = data.terraform_remote_state.infra.outputs.security_group
}


locals {
  directory_subnet_1 = data.terraform_remote_state.infra.outputs.directory_subnet_1
}

# Fetch Private Subnet output data from Infrastructure state file for directory
locals {
  directory_subnet_2 = data.terraform_remote_state.infra.outputs.directory_subnet_2
}
