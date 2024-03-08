
variable "ami" {
  default = "ami-0c7217cdde317cfec"
}

variable "directory_controller" {
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

variable "az" {
  default = "us-east-1"
}