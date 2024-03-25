# Choosing randam numbers for naming 
resource "random_id" "id" {
  byte_length = 1
}


# Creating securtiy group for this ec2 instance
resource "aws_security_group" "sg" {
  name = var.sg_name
  vpc_id = var.vpc  

  # Incoming traffic rule
  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = var.protocol_name
    cidr_blocks = [ var.blocks ]
  }

  tags = {
    Name = "Security-Group-${random_id.id.hex}"
  }
}


# Creating Ec2 instace 
resource "aws_instance" "ec2-instance" {
  ami = var.ami
  instance_type = var.instance_type

  # To create EC2 instance in public subnet
  subnet_id = var.subnet_id

  # Security group that is created above 
  security_groups = [ aws_security_group.sg.id ]
  
  tags = {
    Name = "EC2-${random_id.id.hex}"
  }
}

# This output to refer EC2 instance id at the end
output "EC2" {
  value = aws_instance.ec2-instance.id
}

# This output to refer security group id at the end
output "SG" {
  value = aws_security_group.sg.id
}

output "IP" {
  value = aws_instance.ec2-instance.public_ip
}