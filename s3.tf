resource "aws_s3_bucket" "first" {
  bucket = var.first_bucket_name  
  acl    = var.acl  
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.first.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioningexample" {
  bucket = aws_s3_bucket.first.id

  versioning_configuration {
    status = var.status 
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.first.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_s3_kms_key.arn
      sse_algorithm     = var.sse_algorithm  
    }
  }
}

resource "aws_s3_bucket_logging" "example" {
  bucket        = aws_s3_bucket.first.id
  target_bucket = aws_s3_bucket.first.id
  target_prefix = var.target_prefix  
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_config" {
  bucket = aws_s3_bucket.first.id

  rule {
    id     = var.id   
    status = var.status 

    abort_incomplete_multipart_upload {
      days_after_initiation = var.days_after_initiation   
    }
  }
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.snstopic.arn
  protocol  = var.protocol   
  endpoint  = var.endpoint  
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.first.id

  topic {
    topic_arn     = aws_sns_topic.snstopic.arn
    events        = var.bucket_notification_events     
  }
}

resource "aws_s3_bucket" "second" {
  bucket = var.second_bucket_name    
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "access_good_2" {
  bucket = aws_s3_bucket.second.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioningexample_2" {
  bucket = aws_s3_bucket.second.id

  versioning_configuration {
    status = var.status  
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_2" {
  bucket = aws_s3_bucket.second.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_s3_kms_key.arn
      sse_algorithm     = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_logging" "example_2" {
  bucket        = aws_s3_bucket.second.id
  target_bucket = aws_s3_bucket.second.id
  target_prefix = var.target_prefix 
}


resource "aws_s3_bucket_replication_configuration" "first" {
  depends_on = [aws_s3_bucket_versioning.versioningexample]
  role   = aws_iam_role.my_replication.arn
  bucket = aws_s3_bucket.first.id

  rule {
    status = var.status
    destination {
      bucket        = aws_s3_bucket.second.arn  
      storage_class = var.storage_class   
    }
  }
}

resource "aws_s3_bucket_replication_configuration" "second" {
  depends_on = [aws_s3_bucket_versioning.versioningexample_2]
  role   = aws_iam_role.my_replication.arn
  bucket = aws_s3_bucket.second.id

  rule {
    status = var.status
    destination {
      bucket        = aws_s3_bucket.first.arn  
      storage_class = var.storage_class
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_config_2" {
  bucket = aws_s3_bucket.second.id

  rule {
    id     = var.id 
    status = var.status 

    abort_incomplete_multipart_upload {
      days_after_initiation = var.days_after_initiation
    }
  }
}

resource "aws_s3_bucket_notification" "bucket_notification_2" {
  bucket = aws_s3_bucket.second.id

  topic {
    topic_arn     = aws_sns_topic.snstopic.arn
    events        = var.bucket_notification_events 
  }
}


