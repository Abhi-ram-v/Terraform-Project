data "aws_policy_document" "topic" {
  statement {
    effect = var.effect   

    principals {
      type        = var.type  
      identifiers = var.identifiers 
    }

    actions   = var.actions   
    resources = var.resources   

    condition {
      test     = var.condition_test     
      variable = var.condition_variable    
      values   = [aws_s3_bucket.first.arn, aws_s3_bucket.second.arn]
    }
  }
}

resource "aws_sns_topic" "snstopic" {
  name = var.sns_topic_name    
  policy = data.aws_policy_document.topic.json

  kms_master_key_id = aws_kms_key.my_s3_kms_key.arn
}

