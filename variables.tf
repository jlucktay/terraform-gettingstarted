variable "access_key" {}
variable "secret_key" {}
variable "consul_instance_private_key_path" {}

variable "region" {
  default = "eu-west-2"
}

variable "default_tags" {
  type = "map"

  default = {
    Owner   = "james.lucktaylor"
    Purpose = "Learning Terraform"
  }
}

variable "resource_name_prefix" {
  type    = "string"
  default = "james.lucktaylor.terraform-"
}

variable "amis" {
  type = "map"

  default = {
    "ca-central-1" = "ami-a455e8c0"
    "eu-west-2"    = "ami-78e8fd1c"
    "us-east-1"    = "ami-b374d5a5"
    "us-west-2"    = "ami-4b32be2b"
  }
}
