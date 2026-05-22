terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# VPC
module "vpc" {
  source = "../../modules/vpc"
}

# Subnet
module "subnet" {
  source  = "../../modules/subnet"
  vpc_id  = module.vpc.vpc_id
}

# Internet Gateway
module "igw" {
  source = "../../modules/network"
  vpc_id = module.vpc.vpc_id
}

# Route Table
module "route_table" {
  source    = "../../modules/route-table"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
}

# EC2
module "ec2" {
  source = "../../modules/ec2"
  subnet_id = module.subnet.subnet_id
}