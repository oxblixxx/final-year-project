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

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
# resource "aws_key_pair" "bastion_host" {
#   key_name   = "bastion_host_kp"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB33tHR6VyPEWawmBaHGi782Sw/Utl+PfNSQlfiNeKA5fRDgJu9oXHxZ+Rk6IJaqId2pDM43fxkFTveIBpWfYKrrsDw/GlXcPcYqTn5Jgu6jiwnZQJLT5yZQaIdFKSrHW6srgdCzE03NRnKoZ63zW7VKF+6kn+X/MVi4bOkrgc1ADfaENReabv/fCohMOetHwad/XdS31dERo4RNYivK7OaTNChCIpqnXfZ6o6BpTN8qU2+7LII+FLLI+4c4g+mJF2y2OD5M4jUCW3I37/31JfANDPz/xk/VEGyr/ji604TgSHm6ziD7VpSSI4Rb0dWhEm6G9ar+sfbEeKfhhK/8BBRK4wOujshSi+1Q8LneHnM1B4lma4MZyqFyTz7AffmtXL0wRREOxThJjcdsk8BxXK2bjB8wrgeIIF6kPFCjv6BKG9WFJpC+e84iU6y7nMqPf7Q95RCgSdGR3LulGSEeYCgydbri7dLPhcFCS+TwuUxsdzmU0YLC1hCN1zoBH5gxk= ox@ox-baremetal"
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













