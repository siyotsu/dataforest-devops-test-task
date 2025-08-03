resource "aws_instance" "app" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              yum update -y
              yum install -y git
              yum install -y docker
              service docker start
              usermod -a -G docker ec2-user

              curl -SL https://github.com/docker/compose/releases/download/v2.39.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose

              cd /home/ec2-user
              git clone https://github.com/siyotsu/dataforest-devops-test-task.git
              cd dataforest-devops-test-task/ec2-configuration
              chown -R ec2-user:ec2-user /home/ec2-user/dataforest-devops-test-task

              docker-compose up -d
              EOF

  tags = {
    Name = "AppInstance"
    Role = "Application Server"
  }
}

resource "aws_security_group" "app_sg" {
  name   = "app-sg"
  vpc_id = aws_vpc.main.id

  ingress {
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
}
