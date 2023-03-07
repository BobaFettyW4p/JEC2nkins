resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.key_pair.key_name
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.securityGroup.id]
  user_data = "${file("jenkins.sh")}"
  tags = {
    name = "JEC2nkins"
  }

  volume_tags = {
    "name" = "JEC2nkins"
  }
}