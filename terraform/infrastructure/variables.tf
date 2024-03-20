variable "ami" {
  default = "ami-0c7217cdde317cfec"
}

variable "directory_controller" {
  default = 2
}

variable "workspaces" {
  default = 2
}


variable "bool" {
  default = "true"
  type    = bool
}

variable "name" {
  default = "as"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "account_number" {
  default = 432813148866
}

variable "number" {
  default = 3
  type = number
}

variable "availability_zones" {
  type = map(string)
  default = {
    "1" = "us-east-1a"
    "2" = "us-east-1b"
  }
}

variable "directory_cidr_bl" {
  default = "192.168.1.0/29"
}

variable "public_subnet" {
  default = "192.168.2.0/29"
}

variable "private_subnet_directory" {
  type = map(string)
  default = {
    "1" = "192.168.3.0/29"
    "2" = "192.168.4.0/29"
  }
}

variable "private_subnet_workspace" {
  type = map(string)
  default = {
    "1" = "192.168.5.0/29"
    "2" = "192.168.6.0/29"
  }
}
