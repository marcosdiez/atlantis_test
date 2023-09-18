provider "aws" {
  region  = "us-east-1"
  profile = local.profile

  default_tags {
    tags = {
      terraform = "/home/ubuntu/code/atlantis/terraform"
    }
  }
}

# Learn our public IP address
data "http" "icanhazip" {
  url = "http://icanhazip.com"
}

data "aws_route53_zone" "xrd" {
  name = local.domain
}

locals {
  domain          = "xrd.com.br"
  hostname        = "atlantis.${local.domain}"
  region          = "us-east-1"
  profile         = "webdanfe_mdiez"
  public_ip       = chomp(data.http.icanhazip.response_body)
  temp            = split(".", local.public_ip)
  public_ip_range = "${local.temp[0]}.${local.temp[1]}.${local.temp[2]}.0/24"
  vpc_id          = "vpc-0d77922908f66b2de"
}


resource "aws_route53_record" "xrd" {
  zone_id = data.aws_route53_zone.xrd.zone_id
  name    = local.hostname
  type    = "A"
  ttl     = 300
  records = [aws_instance.atlantis.public_ip == "" ? "8.8.8.8" : aws_instance.atlantis.public_ip]
}


# terraform import aws_route53_record.xrd "Z0097651QXBS8RQC1ZQ5_openvpn2.xrd.com.br_A"