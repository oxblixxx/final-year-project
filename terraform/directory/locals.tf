locals {
  vpc_id = data.terraform_remote_state.vpc_id.outputs.vpc_id
}


locals {
  directory_subnet_2 = data.terraform_remote_state.vpc_id.outputs.directory_subnet_2
}

locals {
  directory_subnet_1 = data.terraform_remote_state.vpc_id.outputs.directory_subnet_1
}
