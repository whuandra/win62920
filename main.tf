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
/*
resource "aws_route53_record" "simple" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "simple.aws3.winoto.com"
  type    = "A"
  ttl     = 300
  records = ["192.0.0.3"]
set_identifier = "simpledev"
weighted_routing_policy {
    weight = 50
  }
}
resource "aws_route53_record" "simple2" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "simple.aws3.winoto.com"
  type    = "A"
  ttl     = 300
  records = ["192.0.0.4"]
set_identifier = "simpleprod"
weighted_routing_policy {
    weight = 60
  }
}
*/
/*
//creating simple policy
resource "aws_route53_record" "simple" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "simple.aws3.winoto.com"
  allow_overwrite = false
  type    = "A"
  ttl     = 300
  records = ["192.0.0.3"]
}
*/



resource "aws_route53_record" "simple" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "simple.aws3.winoto.com"
  type    = "A"
  allow_overwrite = false
  ttl     = 300
  records = ["192.0.0.3"]
set_identifier = "simpledev"
latency_routing_policy {
    region = "us-east-1"
  }
}

resource "aws_route53_record" "simple2" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "simple.aws3.winoto.com"
  type    = "A"
  allow_overwrite = false
  ttl     = 300
  records = ["192.0.0.4"]
set_identifier = "simpleprod"
latency_routing_policy {
    region = "us-west-1"
  }
}
/*
resource "aws_route53_record" "late1" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "late.aws3.winoto.com"
  type    = "A"
  ttl     = 300
  records = ["192.0.0.10"]
set_identifier = "latedev"
latency_routing_policy {
    region = "us-west-1"
  }
}
*/
/*
resource "aws_route53_record" "late2" {
  zone_id = aws_route53_zone.aws3.zone_id
  name    = "late.aws3.winoto.com"
  type    = "A"
  ttl     = 300
  records = ["192.0.0.11"]
set_identifier = "lateprod"
latency_routing_policy {
    region = "us-east-1"
  }
}
*/
resource "aws_elb" "win-lb" {
  name               = "win-lb21125"
  availability_zones = ["us-east-1a"]
 load_balancer_type = "application"
  listener {
    instance_port      = 443
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:590661738553:certificate/b8a78dda-c6cd-46eb-90b5-ae5b385b55fc"
  }

  tags = {
    Name = "win-lb21125"
  }
}
