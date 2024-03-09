# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance
# resource "aws_instance" "bastion_host" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public_subnet_main.id
#   key_name               = aws_key_pair.bastion_host.key_name
#   vpc_security_group_ids = [aws_security_group.public_subnet_main.id]
#   tags = {
#     Name        = "bastion_host"
#     Terraform   = "true"
#     Environment = "development"
#   }
#   volume_tags = {
#     Name      = "EFS_TEST_ROOT"
#     Terraform = "true"
#   }
# }

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
# resource "aws_key_pair" "bastion_host" {
#   key_name   = "bastion_host_kp"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }


# resource "aws_instance" "internal_server" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   subnet_id     = aws_subnet.private_subnet_main.id
#   #  user_data       = data.template_file.script.rendered
#   vpc_security_group_ids = [aws_security_group.private_subnet_main.id]
#   tags = {
#     Name        = "EFS_TEST"
#     Terraform   = "true"
#     Environment = "Development"
#   }
#   volume_tags = {
#     Name      = "EFS_TEST_ROOT"
#     Terraform = "true"
#   }
# }












