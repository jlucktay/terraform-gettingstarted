output "consul_address" {
  value = "${module.consul.server_address}"
}

output "ip" {
  value = "${aws_eip.my_eip.public_ip}"
}
