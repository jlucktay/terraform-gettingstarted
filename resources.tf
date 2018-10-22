resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = "${merge(
    var.default_tags,
    map("Name", "${var.resource_name_prefix}vpc"),
    map("KillDate", "${var.tag_killdate}")
  )}"

  lifecycle {
    ignore_changes = [
      "tags.%",
    ]
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = "${merge(
    var.default_tags,
    map("Name", "${var.resource_name_prefix}subnet"),
    map("KillDate", "${var.tag_killdate}")
  )}"
}

resource "aws_instance" "my_instance" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.nano"
  subnet_id     = "${aws_subnet.my_subnet.id}"

  tags = "${merge(
    var.default_tags,
    map("Name", "${var.resource_name_prefix}instance"),
    map("KillDate", "${var.tag_killdate}")
  )}"

  lifecycle {
    ignore_changes = [
      "tags.%",
      "tags.StopDaily",
    ]
  }
}

resource "aws_eip" "my_eip" {
  instance = "${aws_instance.my_instance.id}"
  vpc      = true

  provisioner "local-exec" {
    command = "mkdir -p output ; echo ${aws_eip.my_eip.public_ip} > output/ip_address.txt"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags = "${merge(
    var.default_tags,
    map("Name", "${var.resource_name_prefix}igw"),
    map("KillDate", "${var.tag_killdate}")
  )}"
}

resource "aws_eip_association" "my_eip_assoc" {
  instance_id   = "${aws_instance.my_instance.id}"
  allocation_id = "${aws_eip.my_eip.id}"
}
