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

resource "aws_subnet" "private_subnet_main" {
  count = 3

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.main_vpc.cidr_block, count.index, 28)

  # Availability zone can be set here if needed
  availability_zone = var.az[count.index]

  # Tags can be added here if needed
  tags = {
    Name = format("PrivateSubnet-%d", count.index)
  }
}

