variable "vpc_varaiable" {
  description = "VPC CIDR Block"
  type = string
}

variable "public_subnet" {
  description = "Public Subnet"
  type = string
}

variable "private_subnet" {
  description = "Private Subnet"
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



variable "eg_protocol" {
  description = "Egress protocol name"
  type = string
}

variable "eg_role_no" {
  description = "Egress role number"
  type = number
}

variable "eg_action" {
  description = "Egress action"
  type = string
}

variable "eg_cidr" {
  description = "Egress cidr blocks"
  type = string
}

variable "eg_from_port" {
  description = "Egress from port"
  type = number
}

variable "eg_to_port" {
  description = "Egress to port"
  type = number
}



variable "in_protocol" {
  description = "Egress protocol name"
  type = string
}

variable "in_role_no" {
  description = "Egress role number"
  type = number
}

variable "in_action" {
  description = "Egress action"
  type = string
}

variable "in_cidr" {
  description = "Egress cidr blocks"
  type = string
}

variable "in_from_port" {
  description = "Egress from port"
  type = number
}

variable "in_to_port" {
  description = "Egress to port"
  type = number
}

variable "ami" {
  description = "AMI for instance"
  type = string
}


variable "instance_type" {
  description = "Instance Type for instance"
  type = string
}

variable "region" {
  description = "Region you want"
  type = string
}

variable "dyanmo-name" {
  description = "DynamoDB name"
  type = string
}


variable "read-cap" {
  description = "Read Capacity"
  type = number
}

variable "write_cap" {
  description = "Write Capacity"
  type = number
}

variable "hash" {
  description = "Hash Key for DB"
  type = string
}

variable "attr_name" {
  description = "Attribute Name"
  type = string
}

variable "attr_type" {
  description = "Attribute Type"
  type = string
}

