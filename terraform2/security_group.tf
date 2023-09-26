resource "aws_security_group" "atlantis" {

  name        = "atlants"
  description = "I can do 22 and the world 4141"
  vpc_id      = local.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "Atlants - GitHub IPs"
    from_port   = 4141
    to_port     = 4141
    protocol    = "tcp"
    cidr_blocks = [
      "192.30.252.0/22",
      "185.199.108.0/22",
      "140.82.112.0/20",
      "143.55.64.0/20",
      # "2a0a:a440::/29",
      # "2606:50c0::/32"
    ]
  }

  ingress {
    description = "OnlyMyIP"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${local.public_ip}/32"]
  }
}