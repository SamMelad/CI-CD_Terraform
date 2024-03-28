resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_varaiable
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
}

# Creating Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
}


# Creating Public Route Table For Our Public Subnet (Needed For EC2 Instance)
resource "aws_route_table" "public_route_table" { 
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Associate public subnet with public route table
resource "aws_route_table_association" "public_table_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_route_table.id
}

# This output to refer public subnet id at the end (Used in main file to refer to public subnet)
output "public_subnet_id" {
  value = aws_subnet.public.id
}


# -------------------------------------------------------------------------------------------


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCLkMQrpUERem0297ma7FDJKTJ/abHGkHpr4WxKhiJCfcvVrAJeGguWziFtQxs4BpX0mz6gv5FWqhuXwZoeUKHt0tihy4RJWV9uoSkWMoH8OTvw6vAg77mFk8UbxszfS1zYey7W1gAH2HVqJYhboImoNGZf+8LgsGS27AoSp40sBUY6YuzMXNsei8R674DN1IeL/z1vgcuT5Kcgudn56VWEH1LsE9qOc5IAD9DssffRMYkCrQBRGpXrcVsqGIHTD9UcuD3vDvxvGnYhbBFaHkL+jGq6TzEohPgDUnMAEtDupUsYtR2x7+CRKQbl73WWU1/R0sYKT8Yd8Hmp4GlgQatn CI/CD"
}


# Creating Ec2 instace 
resource "aws_instance" "ec2-instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  # To create EC2 instance in public subnet
  subnet_id = aws_subnet.public.id

  depends_on = [ 
    aws_vpc.main_vpc,
    aws_subnet.public,
    aws_internet_gateway.gw,
    aws_route_table.public_route_table,
    aws_route_table_association.public_table_assoc,
    aws_key_pair.deployer
   ]

}

# This output to refer EC2 instance id at the end
output "EC2" {
  value = aws_instance.ec2-instance.id
}

output "instance_ip" {
  value = aws_instance.ec2-instance.public_ip
}


#------------------------------------------------------------------------------------------------------------------
