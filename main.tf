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

resource "aws_route53_zone" "aws3" {
  name = "aws3.winoto.com"
}

resource "aws_route53_record" "joinme1" {
  zone_id = aws_route53_zone.aws3.zone.id
  name    = "joinme.aws2.winoto.com"
  type    = "A"

  weighted_routing_policy {
    weight = 100
  }
  set_identifier = "joinmeprod"
  
  records = ["192.0.2.1"]
  ttl     = 300
}

resource "aws_route53_record" "joinme2" {
  zone_id = aws_route53_zone.aws3.zone.id
  name    = "joinme.aws2.winoto.com"
  type    = "A"

  weighted_routing_policy {
    weight = 50
  }
  set_identifier = "joinmedev"
  
  records = ["192.0.2.2"]
  ttl     = 300
}
