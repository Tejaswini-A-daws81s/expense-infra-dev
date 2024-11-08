terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.73"
    }
  }

   backend "s3" {
    bucket = "81-remote-storage"
    key    = "expense-application-lb"
    region = "us-east-1"
    dynamodb_table = "81-locking"
    
  }

}

provider "aws" {
   
  region = "us-east-1"
}