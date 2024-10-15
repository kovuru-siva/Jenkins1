variable "instance_ami" {
  default = "ami-078264b8ba71bc45e"

}

variable "instance-type" {
  type = map(string)
  default = {
    "ap-south-1" = "t2-medium"
  }

}

variable "public-key" {
  default = "~/.ssh/id_ed25519.pub"

}
