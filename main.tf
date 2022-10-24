terraform {
    required_providers {
        aws = ">= 2.0.0"
        null = ">= 2.0.0"
    }
}

provider "aws" {
    region = "ap-southeast-1"
}

# Create new S3 Bucket
resource "aws_s3_bucket" "static_website_bucket" {
    bucket = var.aws_s3_bucket
    force_destroy = true
}

# Set website hosting
resource "aws_s3_bucket_website_configuration" "static_website_bucket" {
    bucket = aws_s3_bucket.static_website_bucket.id

    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }
}

# Run local command to list all S3 Buckets
resource "null_resource" "run_aws_s3_cp" {
    depends_on = [aws_s3_bucket.static_website_bucket]

    provisioner "local-exec" {
        command = <<-EOF
            aws s3 cp website/ s3://${aws_s3_bucket.static_website_bucket.id}/ --recursive --metadata-directive REPLACE --acl public-read
        EOF
        interpreter = ["/bin/bash", "-c"]
    }
}