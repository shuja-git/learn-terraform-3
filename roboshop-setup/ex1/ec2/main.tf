resource "aws_instance" "instance"{
  ami =      "ami-0f3c7d07486cad139"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.component
  }
}
resource "aws_route53_record" "record" {
  zone_id = "Z10377495CKDE7OXJB1E"
  name    = "${var.component}-dev.shujathdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.public_ip]
}

