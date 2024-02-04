resource "aws_instance" "my-test-Instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  tags = {
    Name = "My-Test-Instance"
  }
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_security_group" "my-sg" {
  name   = "my-sg"
  vpc_id = aws_vpc.my-vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
}

data "aws_route53_zone" "My-Zone" {
  name         = "shujadevops.online"
  }

resource "aws_route53_record" "my-dns-record" {
  zone_id = data.aws_route53_zone.My-Zone.zone_id
  name    = "frontend.shujadevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.my-test-Instance.public_ip]
}
