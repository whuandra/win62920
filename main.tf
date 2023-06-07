provider "aws" {
    region = "us-east-1"
}

variable "aws_resources" {
    default = {
        keyname = "key41220good"
    }
}

resource "aws_instance" "Windows" {
    ami = "ami-0ab05a04b66a879af"
    instance_type = "m5.2xlarge"
    key_name = lookup(var.aws_resources, "keyname")
    
    tags = {
        Name = "Test Server"
    }
}
   
    
