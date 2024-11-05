provider "aws" {
  region = "ap-south-1"

}

module "vpc" {
  source = "./Module/vpc"

}


resource "aws_instance" "Terraform" {
  ami             = var.instance_ami
  instance_type   = lookup(var.instance-type, "ap-south-1", "t2.medium")
  subnet_id       = module.vpc.publicsubnet
  security_groups = [module.vpc.security-group]
  key_name        = aws_key_pair.webkey.key_name

}

resource "aws_key_pair" "webkey" {
  key_name   = "webkey"
  public_key = file(var.public-key)

}


