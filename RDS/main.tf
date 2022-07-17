terraform {
  backend "s3" {

    bucket = "cloud4u-qa-state"
    key    = "projeto_rds_terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {

  region = var.region


}
