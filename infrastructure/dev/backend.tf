terraform {
  backend "s3" {
    bucket         = "my-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
