terraform {
  backend "s3" {
    bucket = "devopsb71-bucket"
    key    = "s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "cart" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-08f41a3b66746e56a"]
}
