resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = lookup(var.instance_type,terraform.workspace)

  tags = {
    Name    = "terrademo-ec2-${terraform.workspace}"
    purpose = " terraform demo for ec2 instance"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_terra-${terraform.workspace}"
  description = "allowing all for terraform demo"
  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "allow_tls for demo"
  }
}