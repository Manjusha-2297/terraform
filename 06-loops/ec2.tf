provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  count         = 2
  ami           = "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
  tags          = {
    Name        = "sample"
  }
}