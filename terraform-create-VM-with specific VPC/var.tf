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
  default="vpc-00ea3668106f9d79c"
}
variable "subnet_id" {
  default="subnet-0523f4ff338a37e82"
}
variable "security_group_id" {
  default="sg-0bbeec86013434a9c"
}
