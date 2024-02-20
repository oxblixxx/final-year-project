# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public_subnet_main" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}

 
resource "aws_route_table" "private_subnet_main" {
  vpc_id = aws_vpc.main_vpc.id

#   route {
#     cidr_block = "192.168.0.0/16"
#     gateway_id = aws_internet_gateway.igw.id
#   }

  tags = {
    Name = "example"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "public_subnet_main" {
  subnet_id =  aws_subnet.public_subnet_main.id
  route_table_id = aws_route_table.public_subnet_main.id
}

resource "aws_route_table_association" "private_subnet_main" {
  subnet_id      = aws_subnet.private_subnet_main.id
  route_table_id = aws_route_table.private_subnet_main.id
}
