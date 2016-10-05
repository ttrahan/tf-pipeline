# ========================ECS Instances=======================
# ECS Instance Security group
resource "aws_security_group" "demoInstSG" {
  name = "demoInstSG"
  description = "ECS instance security group"
  vpc_id = "${var.vpc_name}"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [
      "${var.public0-0CIDR}"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  tags {
    Name = "demoInstSG"
  }
}

# Container instances for ECS
resource "aws_instance" "demoECSIns-test" {
  count = 2

  # ami = "${var.ecsAmi}"
  ami = "${lookup(var.ecsAmi, var.region)}"
  availability_zone = "${lookup(var.availability_zone, var.region)}"
  instance_type = "t2.micro"
  key_name = "${var.aws_key_name}"
  subnet_id = "${var.demoPubSubnet}"
  iam_instance_profile = "${var.demoECSInstProf}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "#!/bin/bash \n echo ECS_CLUSTER=demo-shippable-ecs-test >> /etc/ecs/ecs.config"

  security_groups = [
    "${aws_security_group.demoInstSG.id}"]

  tags = {
    Name = "demoECSIns-test${count.index}"
  }
}
