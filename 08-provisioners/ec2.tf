provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  count         = 1
  ami           = "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


#  provisioner "remote-exec" {
#    connection {
#      user = "centos"
#      password = "DevOps321"
#      host = self.public_ip
#    }
#
#    inline = [
#      "uptime"
#    ]
#  }
}

resource "null_resource" "remote" {
  count = 1
  provisioner "remote-exec" {

    connection {
      user = "centos"
      password = "DevOps321"
      host = element(aws_instance.sample.*.public_ip, count.index)

    }

    inline = [
      #      "uptime"
      #    ]
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  tags = {
    Name = "allow_tls"
  }
}