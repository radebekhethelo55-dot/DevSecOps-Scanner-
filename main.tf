provider "aws" {
  region = "us-east-1"
}

# VULNERABILITY 1: Unencrypted S3 Bucket with Public Access
resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "my-company-dev-data-12345"
}

resource "aws_s3_bucket_public_access_block" "vulnerable_bucket_access" {
  bucket = aws_s3_bucket.vulnerable_bucket.id

  block_public_acls       = false  # BAD PRACTICE
  block_public_policy     = false  # BAD PRACTICE
  ignore_public_acls      = false  # BAD PRACTICE
  restrict_public_buckets = false  # BAD PRACTICE
}

# VULNERABILITY 2: Security Group with Open SSH (0.0.0.0/0)
resource "aws_security_group" "vulnerable_sg" {
  name        = "open-ssh-sg"
  description = "Security group with open SSH to the world"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # BAD PRACTICE: Open SSH
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}