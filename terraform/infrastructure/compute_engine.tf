resource "aws_network_interface" "bastion_host" {
  subnet_id   = module.vpc.public_subnets[0]
  private_ips = ["10.0.101.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "bastion_host" {
  ami           = "ami-0b2ff60c5f576d8ee" # Microsoft Windows Server 2019 with Desktop Experience
  instance_type = "t2.micro"   
  vpc_security_group_ids = [aws_security_group.bastion_host.id]
  associate_public_ip_address = true
  get_password_data = true
  availability_zone = "eu-west-2a"
  subnet_id = module.vpc.public_subnets[0]
  key_name = "ox-directory"
  #depends_on = [ aws_key_pair.bastion_host ]
}

# resource "aws_key_pair" "bastion_host" {
#   key_name   = "windows_bastion_host"
#   public_key = "ox-aug-2023"
# }