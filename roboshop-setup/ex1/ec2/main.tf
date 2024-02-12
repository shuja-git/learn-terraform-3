resource "aws_instance" "instance"{
  ami =      "ami-0f3c7d07486cad139"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.component
  }
}
output "private_ip" {
  value = aws_instance.instance.private_ip
}