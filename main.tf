provider "aws" { 
                  region = var.aws_region
               }

resource "aws_vpc" "main" { 
                            cidr_block = "10.0.0.0/16"
                          }

resource "aws_subnet" "public" { 
                                 vpc_id            = aws_vpc.main.id
                                 cidr_block        = "10.0.1.0/24"
                                 availability_zone = "${var.aws_region}a"
                               }

resource "aws_instance" "web" { 
                                ami           = "ami-0c55b159cbfafe1f0" 
                                instance_type = var.instance_type
                                subnet_id     = aws_subnet.public.id
                              }
