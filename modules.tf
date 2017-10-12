module "consul" {
  source = "github.com/hashicorp/consul/terraform/aws"

  key_name = "${var.resource_name_prefix}key"
  key_path = "${var.consul_instance_private_key_path}"
  region   = "${var.region}"
  servers  = "3"
}
