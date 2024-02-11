# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_vpc_igw12345"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway_attachment
resource "aws_internet_gateway_attachment" "main_vpc" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main_vpc.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface
resource "aws_network_interface" "bastion_host" {
  subnet_id       = aws_subnet.public_subnet_main.id
  private_ips     = ["192.168.0.20"]
  security_groups = [aws_security_group.public_subnet_main.id]

  attachment {
    instance     = aws_instance.bastion_host.id
    device_index = 1
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_attachment
resource "aws_network_interface_attachment" "bastion_host" {
  instance_id          = aws_instance.bastion_host.id
  network_interface_id = aws_network_interface.bastion_host.id
  device_index         = 0
}

resource "aws_network_interface" "internal_server" {
  subnet_id       = aws_subnet.private_subnet_main.id
  private_ips     = ["192.168.0.21"]
  security_groups = [aws_security_group.private_subnet_main.id]

  attachment {
    instance     = aws_instance.internal_server.id
    device_index = 1
  }
}

resource "aws_network_interface_attachment" "test" {
  instance_id          = aws_instance.bastion_host.id
  network_interface_id = aws_network_interface.bastion_host.id
  device_index         = 0
}