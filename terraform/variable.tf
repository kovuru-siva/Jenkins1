variable "aws_region" {
    type = string
    default = "ap-south-1"
  
}

variable "vpc_subnet" {
    type = map(string)
    default = {
      "key1" = "ap-south-1a"
      "key2" = "ap-south-1b"
    }
  
}

variable "subnet_cidr" {
    type = map(string)
    default = {
      "key1" = "10.0.1.0/24"
      "key2" = "10.0.2.0/24"
    }
  
}

variable "aws_instance_type" {
    type = list(string)
    default = [ "t2.medium","t2-small" ]
  
}