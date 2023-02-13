terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.30.0"
    }
  }

  # CANNOT USE VARS in this section!!
  backend "s3" {
    endpoint                    = "us-southeast-1.linodeobjects.com" # created in init-state
    profile                     = "linode-s3"
    shared_credentials_file     = "./config/.linode/credentials"
    skip_credentials_validation = true # if set to false will try to authenticate to AWS / amazon
    skip_region_validation      = true
    bucket                      = "wdz-tfstate" # created in init-state
    key                         = "infrastructure/terraform.tfstate"
    region                      = "us-southeast-1" # CANNOT USE VARS HERE
  }
}

provider "linode" {
  token = var.pat_token
}

locals {
  personal_email = "williamdzink@gmail.com"
}