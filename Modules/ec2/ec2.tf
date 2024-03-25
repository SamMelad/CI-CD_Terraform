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

  user_data = <<-EOF
              #!/bin/bash
              echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCLkMQrpUERem0297ma7FDJKTJ/abHGkHpr4WxKhiJCfcvVrAJeGguWziFtQxs4BpX0mz6gv5FWqhuXwZoeUKHt0tihy4RJWV9uoSkWMoH8OTvw6vAg77mFk8UbxszfS1zYey7W1gAH2HVqJYhboImoNGZf+8LgsGS27AoSp40sBUY6YuzMXNsei8R674DN1IeL/z1vgcuT5Kcgudn56VWEH1LsE9qOc5IAD9DssffRMYkCrQBRGpXrcVsqGIHTD9UcuD3vDvxvGnYhbBFaHkL+jGq6TzEohPgDUnMAEtDupUsYtR2x7+CRKQbl73WWU1/R0sYKT8Yd8Hmp4GlgQatn CI/CD" >> /home/ec2-user/.ssh/authorized_keys
              EOF

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