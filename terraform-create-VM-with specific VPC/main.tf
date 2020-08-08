provider "aws" {
  access_key = "******"
  secret_key = "******"
  region     = "us-east-1"
}
data "aws_vpc" "myvpc" {
  id = "${var.vpc_id}"
}
data "aws_subnet" "default" {
  id = "${var.subnet_id}"
}
data "aws_security_group" "defaily" {
  id     = "${var.security_group_id}"
  vpc_id = "${data.aws_vpc.myvpc.id}"
}

resource "aws_instance" "github" {
  count                  = "${var.instance_count}"
  ami                    = "${var.aws_ami_id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${data.aws_security_group.defaily.id}"]
  tags = {
    Name = "Github-enterprise-${timestamp()}"
  }
}
resource "aws_ebs_volume" "data-vol" {
 count             = "${var.instance_count * var.ec2_ebs_volume_count}"
 availability_zone = "${element(aws_instance.github.*.availability_zone, count.index)}"
 size              = "${var.ec2_ebs_volume_size}"
 tags = {
        Name = "data-volume"
 }
}
resource "aws_volume_attachment" "vol-attachment" {
 count       = "${var.instance_count * var.ec2_ebs_volume_count}"
 device_name = "${element(var.ec2_device_names, count.index)}"
 volume_id   = "${aws_ebs_volume.data-vol.*.id[count.index]}"
 instance_id = "${element(aws_instance.github.*.id, count.index)}"
}
