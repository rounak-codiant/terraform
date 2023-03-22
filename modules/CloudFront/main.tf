
# Create Custom Security HeaCloudFront ders Policy
resource "aws_cloudfront_response_headers_policy" "headers_policy" {
  name    = var.headers_policy_name
  comment = "Custom Security Headers Policy"

  security_headers_config {
    content_type_options {
      override = false
    }
    frame_options {
      frame_option = "SAMEORIGIN"
      override     = false
    }
    referrer_policy {
      referrer_policy = "same-origin"
      override        = false
    }
    xss_protection {
      mode_block = true
      protection = true
      override   = false
    }
    strict_transport_security {
      access_control_max_age_sec = "31536000"
      include_subdomains         = true
      preload                    = true
      override                   = false
    }
    content_security_policy {
      content_security_policy = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"
      override                = false
    }
  }

  cors_config {
    access_control_allow_credentials = false

    access_control_allow_headers {
      items = ["*"]
    }

    access_control_max_age_sec = "300"

    access_control_allow_methods {
      items = [
        "GET",
        "HEAD",
        "PUT",
        "POST"
      ]
    }

    access_control_allow_origins {
      items = ["*.test.com"]
    }

    origin_override = false
  }

  custom_headers_config {
    items {
      header   = "Permissions-Policy"
      override = false
      value    = "accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), gyroscope=(self), microphone=(self), payment=*, usb=(), interest-cohort=()"
    }
  }
}


# Create S3 Bucket Policy
resource "aws_s3_bucket_policy" "s3_cdn_policy" {
  bucket = var.s3_bucket_id
  policy = data.aws_iam_policy_document.s3-cdn-policy.json
}


data "aws_iam_policy_document" "s3-cdn-policy" {
  statement {
    sid = "1"
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.access_identity.iam_arn]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${var.s3_bucket_arn}/*"
    ]
  }
}


# Create CloudFront Identity
resource "aws_cloudfront_origin_access_identity" "access_identity" {
  comment = var.s3_bucket_domain_name
}

# # Fatching Cache Policy
# data "aws_cloudfront_cache_policy" "cache_policy" {
#   name = "Managed-CachingOptimized"
# }


# Create CloudFront Distribution
resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = var.s3_bucket_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = var.ipv6_enabled
  http_version        = var.http_version
  comment             = var.cloudfront_description
  default_root_object = ""

  default_cache_behavior {
    target_origin_id       = var.s3_bucket_domain_name
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    viewer_protocol_policy = "allow-all"
    compress               = var.objects_compress

    # Attached Security Headers
    response_headers_policy_id = aws_cloudfront_response_headers_policy.headers_policy.id
    # cache_policy_id            = data.aws_cloudfront_cache_policy.cache_policy.id
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl     = var.min_ttl
    default_ttl = var.default_ttl
    max_ttl     = var.max_ttl
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Environment = "production"
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}