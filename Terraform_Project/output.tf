# This file contain the outputs to see id for each service created

output "VPC" {
  value = module.network-module.vpc
}

output "Public_Subnet" {
  value = module.network-module.public
}

output "Private_Subnet" {
  value = module.network-module.private
}

output "ACL_For_Public_Subnet" {
  value = module.network-module.acl
}

output "EC2_Instance" {
  value = module.EC2-module.EC2
}

output "EC2-IP" {
  value = module.EC2-module.IP
}

output "Security_Group_For_Ec2_Instance" {
  value = module.EC2-module.SG
}

