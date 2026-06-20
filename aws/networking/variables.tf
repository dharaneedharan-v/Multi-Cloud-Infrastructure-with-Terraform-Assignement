variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_name" {
  type    = string
  default = "demo-vpc"
}

variable "subnet_name" {
  type    = string
  default = "public-subnet"
}

variable "security_group_name" {
  type    = string
  default = "web-sg"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
