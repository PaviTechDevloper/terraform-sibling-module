terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.44.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "pavi-vpc"
  }
}