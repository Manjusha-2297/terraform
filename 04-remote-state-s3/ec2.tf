provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-2297"
    key    = "04-remote-state-s3/terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "sample" {
  ami           = "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
}