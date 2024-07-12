# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "bastion_host" {
  name        = "public-sg-group-1234"
  description = "Security group for bastion host in public subnet"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow RDP from 
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

resource "aws_security_group" "domain_controller" {
  name        = "domain-controller"
  description = "Security group for domain controller in private subnet"
  vpc_id      = module.vpc.vpc_id

ingress {
  from_port = 3389
  to_port   = 3389
  protocol  = "tcp"
  security_groups = [aws_security_group.bastion_host.id]
}  

}





