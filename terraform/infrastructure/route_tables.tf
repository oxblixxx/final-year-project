# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public_subnet_main" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

 
resource "aws_route_table" "private_subnet_main" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.natgw_ids
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "public_subnet_main" {
  subnet_id =  module.vpc.public_subnets[0].id
  route_table_id = aws_route_table.public_subnet_main.id
}

resource "aws_route_table_association" "private_subnet_directory_1" {
  # Loop through each private subnet and associate it with the route table
  # Access the subnet ID dynamically using the index
  subnet_id = module.vpc.private_subnets[0].id 
  route_table_id = aws_route_table.private_subnet_main.id
}

resource "aws_route_table_association" "private_subnet_directory_2" {
  # Loop through each private subnet and associate it with the route table
  # Access the subnet ID dynamically using the index
  subnet_id = module.vpc.private_subnets[1].id 
  route_table_id = aws_route_table.private_subnet_main.id
}

resource "aws_route_table_association" "private_subnet_workspace_1" {
  # Access the subnet ID dynamically using the index
  subnet_id = module.vpc.private_subnets[2].id 
  route_table_id = aws_route_table.private_subnet_main.id
}


resource "aws_route_table_association" "private_subnet_workspace_2" {
  # Access the subnet ID dynamically using the index
  subnet_id = module.vpc.private_subnets[3].id 
  route_table_id = aws_route_table.private_subnet_main.id
}