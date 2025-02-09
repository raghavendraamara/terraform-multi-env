terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  
  backend "s3" {
    bucket         = "raghava-devops-tfstate"
    key            = "workspace-demo"
    region         = "us-east-1"
    dynamodb_table = "devops-tstate-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}