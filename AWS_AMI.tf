provider "aws" {
  region  = "${var.region}"
}

resource "aws_instance" "web" {
  ami           = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance_name"
  }
}
