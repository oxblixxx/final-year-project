# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

resource "aws_subnet" "public_subnet_main" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet
  #availability_zone       = ""
  map_public_ip_on_launch = var.bool

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_directory" {
  for_each = toset(keys(var.availability_zones))
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_directory[each.key]

  # Availability zone can be set here if needed
  availability_zone = var.availability_zones[each.key]

  # Tags can be added here if needed
  tags = {
    Name = format("PrivateSubnet-%d", each.key)
  }
}

resource "aws_subnet" "private_subnet_workspace" {
  for_each = toset(keys(var.availability_zones))

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_workspace[each.key]

  # Availability zone can be set here if needed
  availability_zone = var.availability_zones[each.key]

  # Tags can be added here if needed
  tags = {
    Name = format("PrivateSubnet-%d", each.key)
  }
}
