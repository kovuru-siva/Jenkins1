variable "instance_ami" {
    default = "ami-02b49a24cfb9541c"
  
}

variable "instance-type" {
    type = map(string)
    default = {
      "ap-south-1" = "t2-medium"
    }
  
}

variable "public-key" {
    default = "~/.ssh/test.pub"
  
}