# This file contain all variables used in EC2 module


variable "ami" {
  description = "AMI for instance"
  type = string
}


variable "instance_type" {
  description = "Instance Type for instance"
  type = string
}

variable "subnet_id" {
  description = "Public Subnet for EC2"
  type = string
}


variable "sg_name" {
  description = "Security group name"
  type = string
}

variable "from_port" {
  description = "From port in security group"
  type = number
}

variable "to_port" {
  description = "To port security group"
  type = number
}

variable "protocol_name" {
  description = "Protocl name"
  type = string
}

variable "blocks" {
  description = "Wanted Blocks"
  type = string
}



variable "vpc" {
  description = "Security Group VPC"
  type = string
}