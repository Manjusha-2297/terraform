provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  count                  = 1
  ami                    = "ami-0b90346fbb8e13c09"
  instance_type          = "t3.micro"

}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "^Centos-7*"
  owners           = ["973714476881"]
}

output "out" {
  value = data.aws_ami.example.id
}
