# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

resource "aws_subnet" "public_subnet_main" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = ""
  map_public_ip_on_launch = var.bool

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_main" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = ""
  #ss private_dns_hostname_type_on_launch = true
  tags = {
    Name = "Main"
  }
}




