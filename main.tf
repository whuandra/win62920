provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Windows" {
    ami = "ami-0ab05a04b66a879af"
    instance_type = "m5.2xlarge"
    
    tags = {
        Name = "Test Server"
    }
}
   
    
