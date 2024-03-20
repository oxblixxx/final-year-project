# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public_subnet_main" {
  vpc_id = module.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

 
resource "aws_route_table" "private_subnet_main" {
  vpc_id = module.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.nat_gateway
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "public_subnet_main" {
  subnet_id =  module.vpc.public_subnets[count.index]
  route_table_id = aws_route_table.public_subnet_main.id
}

resource "aws_route_table_association" "private_subnet_directory" {
  # Loop through each private subnet and associate it with the route table
  # Access the subnet ID dynamically using the index
  subnet_id = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]] 
  route_table_id = aws_route_table.private_subnet_main.id
}


resource "aws_route_table_association" "private_subnet_workspace" {
  # Access the subnet ID dynamically using the index
  subnet_id = [module.vpc.private_subnets[2], module.vpc.private_subnets[3]] 
  route_table_id = aws_route_table.private_subnet_main.id
}