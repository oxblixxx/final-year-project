# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "public_subnet_main" {
  name        = "public-sg-group-1234"
  description = "Security group for bastion host in public subnet"
  vpc_id = module.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group" "private_subnet_main" {
#   name        = "public-sg-group"
#   description = "Security group for bastion host in public subnet"
#   vpc_id = aws_vpc.main_vpc.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Bastion Host cidr_block
#   }
# }

# resource "aws_security_group" "internal_efs" {
#   name        = "Internal EFS inbound rule"
#   description = "Allow inbound rule from internal_server"
#   vpc_id = aws_vpc.main_vpc.id

#   ingress {
#     from_port   = 2096
#     to_port     = 2096
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Bastion Host cidr_block
#   }
# }






