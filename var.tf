variable "region" {
  default= "us-east-1"
}

variable "vpc_cidr" {
  default= "192.160.0.0/16"
}

variable "subnet_cidr" {
   type = "list"
   default= ["192.160.1.0/24","192.160.2.0/24","192.160.3.0/24"]
}

variable "azs" {
  type= "list"
  default= ["us-east-1a","us-east-1b","us-east-1c"]
}

# for making AZ variablised use Data Source Availability
#variable for main.tf file
variable "region" {
  default= "us-east-2"
}

variable "vpc_id" {
  default="vpc-a31117d9"
}

variable "subnet_id" {
  default="subnet-b66b9ce9"
}

variable "security_group_id" {
  default="sg-0c98bd6fb48255ffc"
}
