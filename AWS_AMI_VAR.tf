variable "region" {
  default= "us-east-2"
}

variable "ec2_ami" {
  type = "map"
  default = {
     us-east-1 = "ami-0555e2e731fa563e3"
     us-east-2 = "ami-0f7919c33c90f5b58"
 }
}
