# First import network module , to create our vpc and subnets  
module "network-module" {
  source = "./Modules/network"
  vpc_varaiable = var.vpc_varaiable
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet

  # Creating access control list for public subnet 
  # Egress
  eg_protocol = var.eg_protocol
  eg_action = var.eg_action
  eg_role_no = var.eg_role_no
  eg_cidr = var.eg_cidr
  eg_from_port = var.eg_from_port
  eg_to_port = var.eg_to_port

  # ingress
  in_protocol = var.in_protocol
  in_action = var.in_action
  in_role_no = var.in_role_no
  in_cidr = var.in_cidr
  in_from_port = var.in_from_port
  in_to_port = var.in_to_port
}

# Import EC2 module for creating EC2 instance and security group for this ec2 instance
module "EC2-module" {
  source = "./Modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = module.network-module.public

  # Creating Security Group for this instance
  sg_name = var.sg_name
  vpc = module.network-module.vpc
  from_port = var.from_port
  to_port = var.to_port
  protocol_name = var.protocol_name
  blocks = var.blocks
}
