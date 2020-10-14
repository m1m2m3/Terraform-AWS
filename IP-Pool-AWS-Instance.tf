provider "aws" {
  region     = "${var.region}"
}

data "aws_vpc" "pls-srv-auto-npe-use1" {
  id = "${var.vpc_id}"
}

#data "aws_subnet_ids" "my_subnet" {
#   id = "${var.subnet_ids}"
#   vpc_id = "var.vpc_id"
#}

data "aws_security_group" "pls-srv-auto-npe-use1-github" {
  id = "${var.security_group_id}"
  vpc_id = "${data.aws_vpc.pls-srv-auto-npe-use1.id}"
}

#resource "aws_network_interface" "github" {
#  count       = "${var.aws_net}"
#  subnet_id   = "${element(var.subnet_ids, count.index)}"
#  subnet_id   = "${var.subnet_ids}"
#  private_ips = ["172.31.10.229", "172.31.25.89"]
#}

resource "aws_instance" "github" {
  count         = "${var.instance_count}"
  ami           = "${var.aws_ami}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"
  vpc_security_group_ids = ["${data.aws_security_group.pls-srv-auto-npe-use1-github.id}"]
  private_ip = "${lookup(var.mgmt_jump_private_ips,count.index)}"
  #  network_interface {
#     network_interface_id = "${aws_network_interface.github.*.id[count.index]}"
#     device_index = 0
#  }
  tags = {
    Name = "Github-npe-${count.index + 1}-${timestamp()}"
  }
}

resource "aws_ebs_volume" "data-vol" {
 count             = "${var.instance_count * var.ec2_ebs_volume_count}"
 availability_zone = "${element(aws_instance.github.*.availability_zone, count.index)}"
 size              = "${var.ec2_ebs_volume_size}"
 tags = {
        Name = "GHE-vol-${timestamp()}"
 }
}
resource "aws_volume_attachment" "vol-attachment" {
 count       = "${var.instance_count * var.ec2_ebs_volume_count}"
 device_name = "${element(var.ec2_device_names, count.index)}"
 volume_id   = "${aws_ebs_volume.data-vol.*.id[count.index]}"
 instance_id = "${element(aws_instance.github.*.id, count.index)}"
}

