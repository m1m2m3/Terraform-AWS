variable "region" {
  default="us-east-1"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}
variable "aws_ami_id" {
  default="ami-02354e95b39ca8dec"
}

variable "instance_type" {
  default="t2.micro"
}
variable "availability_zone" {
  default="us-east-1a"
}

variable "ec2_device_names" {
  default = [
    "/dev/sdd",
    "/dev/sde",
    "/dev/sdf",
  ]
}
variable "ec2_ebs_volume_count" {
  default = 1
}

variable "ec2_ebs_volume_size" {
  default = 1
}

variable "vpc_id" {
  default="vpc-a31117d9"
}
variable "subnet_ids" {
  default= [ "subnet-09a35328", "subnet-26ce2440" ]
}
variable "security_group_id" {
  default="sg-0c98bd6fb48255ffc"
}
