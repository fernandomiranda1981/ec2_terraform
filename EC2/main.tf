terraform {
  backend "s3" {

    bucket = "cloud4u-qa-state"
    key    = "projeto_ec2_terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {

  region = var.region


}
