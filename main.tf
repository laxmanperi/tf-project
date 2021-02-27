# Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "HTTP from Anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH"
  }
}

# Key Pair
resource "aws_key_pair" "my_WIN_key" {
  key_name   = "WIN-key"
  public_key = file(var.PATH_TO_PUB_KEY)
}

# Instance-Build
resource "aws_instance" "my_Build" {
  ami           = var.AWS_AMI[var.AWS_REGION]
  instance_type = "t2.micro"

  # Select Subnet
  subnet_id = aws_subnet.main_public_1.id

  # Select Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Select Key
  key_name = aws_key_pair.my_WIN_key.id

  # Tag
  tags = {
    Name = "Build_Server"
  }

}

# Instance-Sonar
resource "aws_instance" "my_Sonar" {
  ami           = var.AWS_AMI[var.AWS_REGION]
  instance_type = "t2.medium"

  # Select Subnet
  subnet_id = aws_subnet.main_public_1.id

  # Select Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Select Key
  key_name = aws_key_pair.my_WIN_key.id

  # Tag
  tags = {
    Name = "my_Sonar"
  }

}
# Instance-NEXUS
resource "aws_instance" "my_NEXUS" {
  ami           = var.AWS_AMI[var.AWS_REGION]
  instance_type = "t2.medium"

  # Select Subnet
  subnet_id = aws_subnet.main_public_1.id

  # Select Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Select Key
  key_name = aws_key_pair.my_WIN_key.id

  # Tag
  tags = {
    Name = "my_NEXUS"
  }

}
# Instance-TomcatQA
resource "aws_instance" "my_TomcatQA" {
  ami           = var.AWS_AMI[var.AWS_REGION]
  instance_type = "t2.micro"

  # Select Subnet
  subnet_id = aws_subnet.main_public_1.id

  # Select Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Select Key
  key_name = aws_key_pair.my_WIN_key.id

  # Tag
  tags = {
    Name = "my_TomcatQA"
  }

}
# Instance-TomcatProd
resource "aws_instance" "my_TomcatProd" {
  ami           = var.AWS_AMI[var.AWS_REGION]
  instance_type = "t2.micro"

  # Select Subnet
  subnet_id = aws_subnet.main_public_1.id

  # Select Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Select Key
  key_name = aws_key_pair.my_WIN_key.id

  # Tag
  tags = {
    Name = "my_TomcatProd"
  }

}



