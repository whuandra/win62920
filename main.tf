provider "aws" {
    region = "us-east-1"
}

variable "aws_resources" {
    default = {
        keyname = "key41220good"
    }
}
/*
resource "aws_instance" "Windows" {
    ami = "ami-0ab05a04b66a879af"
    instance_type = "m4.2xlarge"
    key_name = lookup(var.aws_resources, "keyname")
    
    tags = {
        Name = "Test Server"
    }
}
*/   
resource "aws_route53_record" "joinme1" {
  zone_id = aws2.winoto.com
  name    = "joinme.aws2.winoto.com"
  type    = "A"

  weighted_routing_policy {
    weight = 100
  }

  records = ["192.0.2.1"]
  ttl     = 300
}

resource "aws_route53_record" "joinme2" {
  zone_id = aws2.winoto.com
  name    = "joinme.aws2.winoto.com"
  type    = "A"

  weighted_routing_policy {
    weight = 50
  }

  records = ["192.0.2.2"]
  ttl     = 300
}
