variable "vpc_varaiable" {
  description = "VPC CIDR Block"
  type = string
}

variable "public_subnet" {
  description = "Public Subnet"
  type = string
}


variable "region" {
  description = ".."
  type = string
}


variable "ami" {
  description = "AMI for instance"
  type = string
}


variable "instance_type" {
  description = "Instance Type for instance"
  type = string
}

