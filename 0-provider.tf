provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "my-eks-terraform-demo"   # 🔁 change to your bucket name
    key            = "eks-demo/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
