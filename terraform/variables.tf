
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
  default = "192.168.1.8/29"
}

variable "workspace_cidr_bl" {
  default = "192.168.10.8/29"
}
