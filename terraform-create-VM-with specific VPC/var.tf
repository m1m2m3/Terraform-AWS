variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
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
