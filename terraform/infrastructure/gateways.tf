resource "aws_network_interface" "public_subnet" {
  subnet_id =  module.vpc.public_subnets
  private_ips = ["10.8.0.5"]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "nat_gw" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.public_subnet.id
}



# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "main_vpc_igw12345"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway_attachment
# resource "aws_internet_gateway_attachment" "main_vpc" {
#   internet_gateway_id = aws_internet_gateway.igw.id
#   vpc_id              = aws_vpc.main_vpc.id
# }

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface
# resource "aws_network_interface" "bastion_host" {
#   subnet_id       = aws_subnet.public_subnet_main.id
#   private_ips     = ["192.168.1.20"]
#   security_groups = [aws_security_group.public_subnet_main.id]

#   attachment {
#     instance     = aws_instance.bastion_host.id
#     device_index = 1
#   }
# }



# resource "aws_network_interface" "nat_gw" {
#   subnet_id       = aws_subnet.private_subnet_main.id
#   private_ips     = ["192.168.1.21"]
#   security_groups = [aws_security_group.private_subnet.id]

#   attachment {
#     instance     = aws_instance.bastion_host.id
#     device_index = 1
#   }
# }

# resource "aws_eip" "nat_gw_1" {
#   domain                    = "vpc"
# #  network_interface         = aws_network_interface.public_subnet.id
# }


# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat_gw_1.id
#   subnet_id     = aws_subnet.public_subnet_main.id

#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igw]
# }









# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_attachment
# resource "aws_network_interface_attachment" "bastion_host" {
#   instance_id          = aws_instance.bastion_host.id
#   network_interface_id = aws_network_interface.bastion_host.id
#   device_index         = 0
# }

# resource "aws_network_interface" "internal_server" {
#   subnet_id       = aws_subnet.private_subnet_main.id
#   private_ips     = ["192.168.1.140"]
#   security_groups = [aws_security_group.private_subnet_main.id]

#   attachment {
#     instance     = aws_instance.internal_server.id
#     device_index = 1
#   }
# }

# resource "aws_network_interface_attachment" "internal_server" {
#   instance_id          = aws_instance.internal_server.id
#   network_interface_id = aws_network_interface.internal_server.id
#   device_index         = 0
# }