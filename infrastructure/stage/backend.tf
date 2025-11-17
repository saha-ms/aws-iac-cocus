terraform {
  backend "s3" {
    bucket         = "my-terraform-state-stage"
    key            = "stage/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
