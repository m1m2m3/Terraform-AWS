variable "region" {
  default="us-east-1"
}
variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}
variable "mgmt_jump_private_ips" {
   default = {
    "0" = "172.31.10.229"
    "1" = "172.31.25.89"
  }
}
variable "vpc_id" {
  default="vpc-a31117d9"
}
variable "subnet_ids" {
  default= [ "subnet-26ce2440", "subnet-2d14ae60" ]
}
variable "security_group_id" {
  default="sg-cfeab4e0"
}
variable "aws_ami" {
  default="ami-0947d2ba12ee1ff75"
}

variable "instance_type" {
  default="t2.micro"
}
variable "ec2_device_names" {
  default = [
    "/dev/sdd"
  ]
}
variable "ec2_ebs_volume_count" {
  default = 1
}

variable "ec2_ebs_volume_size" {
  default = 1
}
