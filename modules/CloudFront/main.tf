
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
      access_control_max_age_sec = var.access_control_max_age
      include_subdomains         = true
      preload                    = true
      override                   = false
    }
    content_security_policy {
      content_security_policy = var.content_security_policy
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
      items = [var.access_control_allow_origins]
    }

    origin_override = false
  }

  custom_headers_config {
    items {
      header   = "Permissions-Policy"
      override = false
      value    = var.permissions_policy
    }
  }
}


# Create S3 Bucket Policy
resource "aws_s3_bucket_policy" "s3_cdn_policy" {
  bucket = var.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_cdn_policy.json
}

data "aws_iam_policy_document" "s3_cdn_policy" {
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

# # Fatching Cache Policy
data "aws_cloudfront_cache_policy" "cache_policy" {
  name = "Managed-CachingOptimized"
}

# # Fatching Origin request policy
data "aws_cloudfront_origin_request_policy" "origin_cache_policy" {
  name = "Managed-CORS-CustomOrigin"
}

resource "aws_cloudfront_origin_access_identity" "access_identity" {
  comment = var.s3_bucket_domain_name
}


# Create CloudFront Distribution
#tfsec:ignore:aws-cloudfront-enable-logging
#tfsec:ignore:aws-cloudfront-use-secure-tls-policy
#tfsec:ignore:aws-cloudfront-enable-waf
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
    target_origin_id           = var.s3_bucket_domain_name
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    viewer_protocol_policy     = "redirect-to-https"
    compress                   = var.objects_compress
    origin_request_policy_id   = data.aws_cloudfront_origin_request_policy.origin_cache_policy.id
    response_headers_policy_id = aws_cloudfront_response_headers_policy.headers_policy.id
    cache_policy_id            = data.aws_cloudfront_cache_policy.cache_policy.id
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
