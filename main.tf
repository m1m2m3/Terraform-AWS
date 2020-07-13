provider "aws" {
  access_key = "xxxxxxxxxxx"
  secret_key = "xxxxxxxxxxx"
  region     = "us-east-1"
}
resource "aws_instance" "Github" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  key_name = "N_virginia"
  tags = {
    Name = "Github-enterprise {{timestamp}}"
  }
 }

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "subnet-b66b9ce9" {
  vpc_id            = "${data.aws_vpc.selected.id}"
  availability_zone = "us-east-1a"
}


data "aws_security_group" "selected" {
  filter {
      name = "Github"
      values = ["sg-0c98bd6fb48255ffc"]
  }
  vpc_id = "${data.aws_vpc.selected.id}"
}
