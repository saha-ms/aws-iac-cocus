provider "aws" {
  region  = "eu-west-1"
  profile = "stage"
}

module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr        = "10.1.0.0/16"
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
  azs             = ["eu-west-1a", "eu-west-1b"]
  tags = {
    Environment = "stage"
    Owner       = "Saha"
  }
}

module "security_group" {
  source      = "../../modules/security_group"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "stage"
  tags = {
    Environment = "stage"
    Owner       = "Saha"
  }
}

module "ec2" {
  source             = "../../modules/ec2"
  ami_id             = "ami-0c55b159cbfafe1f0"
  instance_type      = "t3.micro"
  instance_count     = 2
  subnet_ids         = module.vpc.private_subnets
  security_group_ids = [module.security_group.security_group_id]
  name_prefix        = "stage"
  environment        = "stage"
  tags = {
    Environment = "stage"
    Owner       = "Saha"
  }
}