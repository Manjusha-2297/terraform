provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  count         = 2
  ami           = "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
  tags          = {
    Name        = var.names[count.index]
  }
}

output "ip" {
  value = aws_instance.sample.*.public_ip[0]
}

variable "names" {
  default = ["d1","d2"]
}