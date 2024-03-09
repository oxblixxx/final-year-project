# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

resource "aws_subnet" "public_subnet_main" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "192.168.1.0/25"
  #availability_zone       = ""
  map_public_ip_on_launch = var.bool

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_directory" {
  count = 2

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.directory_cidr_bl, count.index, 4)

  # Availability zone can be set here if needed
  availability_zone = var.availability_zones[count.index + 1]  # Use mapping with index + 1

  # Tags can be added here if needed
  tags = {
    Name = format("PrivateSubnet-%d", count.index)
  }
}

resource "aws_subnet" "private_subnet_workspace" {
  count = 2
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.workspace_cidr_bl, count.index, 4)  # Remove netnum

  # Availability zone can be set here if needed
  availability_zone = var.availability_zones[count.index + 1]  # Use mapping with index + 1

  # Tags can be added here if needed
  tags = {
    Name = format("PrivateSubnet-Workspace-%d", count.index)
  }
}
