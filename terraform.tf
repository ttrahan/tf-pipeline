# ========================ECS Instances=======================

provider "aws" {
    region = "us-east-1"
}

# EC2 instances
resource "aws_instance" "sampleInstances" {
  count = 2

  # ami = "${var.ecsAmi}"
  ami = "ami-0d729a60"
  availability_zone = "us-east-1b"
  instance_type = "t2.micro"
  subnet_id = "demoPubSN0-0-1"
  associate_public_ip_address = true
  source_dest_check = false

  tags = {
    Name = "sampleInstances-${count.index}"
  }
}
