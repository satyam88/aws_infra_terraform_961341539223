#aws-infra-terraform-961341539223

terraform {
  backend "s3" {
    bucket = "aws-infra-terraform-961341539223"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}