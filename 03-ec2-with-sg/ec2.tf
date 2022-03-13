provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  ami           = "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
}