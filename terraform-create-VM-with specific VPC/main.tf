provider "aws" {
  access_key = "*****"
  secret_key = "*****"
  region     = "us-east-1"
}
data "aws_vpc" "myvpc" {
  id = "${var.vpc_id}"
}
data "aws_subnet" "default" {
  id = "${var.subnet_id}"
}
data "aws_security_group" "defaily" {
  id = "${var.security_group_id}"
  vpc_id = "${data.aws_vpc.myvpc.id}"
}

resource "aws_instance" "github" {
  count                  = "${var.instance_count}"
  ami                    = "ami-02354e95b39ca8dec"
  instance_type          = "t2.micro"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${data.aws_security_group.defaily.id}"]
  tags = {
    Name = "Github-enterprise-npe-an-akshay-${timestamp()}"
  }
}
