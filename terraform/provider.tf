terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket = "hextech-iac"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "hextech-iac"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    local.tags,
    {
      Name = "terraform-state-bucket"
    }
  )
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "hextech-iac"

  versioning_configuration {
    status = "Enabled"
  }
}
