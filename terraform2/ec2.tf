data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "atlantis" {
  lifecycle {
    ignore_changes = [ami]
  }
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3a.medium"
  # user_data_replace_on_change = false
  vpc_security_group_ids = [aws_security_group.atlantis.id]
  subnet_id              = "subnet-063668f4d9e4b16ce"
  key_name               = "id_rsa.modus.pub"
  #   associate_public_ip_address = true

  tags = {
    Name = "AtlantisServer"
  }
}

output "ec2_start" {
  value = "   aws --region ${local.region} --profile ${local.profile} ec2 start-instances --instance-ids ${aws_instance.atlantis.id}   "
}

output "ec2_stop" {
  value = "   aws --region ${local.region} --profile ${local.profile} ec2 stop-instances --instance-ids  ${aws_instance.atlantis.id}   "
}

output "ssh" {
  value = "   ssh ubuntu@${local.hostname}   "
}

