resource "aws_route53_record" "record" {
  zone_id = "Z10377495CKDE7OXJB1E"
  name    = "${var.component}-dev.shujathdevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.public_ip]

}

