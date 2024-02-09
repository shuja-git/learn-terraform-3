resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  }

resource "aws_instance" "cart" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  }

resource "aws_security_group" "my-sg" {
  name   = "my-sg"
  vpc_id = data.aws_vpc.default-vpc-id.id

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

resource "aws_route53_record" "frontend-record" {
  zone_id = data.aws_route53_zone.My-Zone.zone_id
  name    = "frontend-dev.shujathdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.public_ip]
}
resource "aws_route53_record" "cart-record" {
  zone_id = data.aws_route53_zone.My-Zone.zone_id
  name    = "cart-dev.shujathdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart.public_ip]
}


