# --- S3バケット作成 ---
resource "aws_s3_bucket" "create" {
  bucket = var.s3_bucket_name
  tags   = { Name = "s3-lambda" }
}

# --- S3バケット暗号化 ---
resource "aws_s3_bucket_server_side_encryption_configuration" "frontend" {
  bucket = aws_s3_bucket.create.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.create.id

  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "frontend" {
  depends_on = [aws_s3_bucket_public_access_block.frontend]
  bucket     = aws_s3_bucket.create.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.create.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.modules_cloudfornt_distribution_arn
          }
        }
    }]
  })
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.create.id

  index_document {
    suffix = "index.html"
  }
}

