terraform {
    required_version = ">= 0.12" #<- fixed
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~>5.82.2" #<- fixed
        }
    }
}

variable "region" {
  type = string
  default = "us-east-1"
}


provider "aws" {
	region = var.region
}


resource "aws_instance" "example_instance" {
  ami           = "ami-12345678"
  instance_type = "t3.medium"

  tags = {
    Name = "ExampleInstance"
  }
}
