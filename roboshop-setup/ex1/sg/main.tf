variable "vpc_id" {
  default = "vpc-0d777bc0eeb02d730"
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_all_inb_outb"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  tags = {
    Name = "allow_tls"
  }

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

output "sg_id" {
  value = aws_security_group.allow_tls.id
}
