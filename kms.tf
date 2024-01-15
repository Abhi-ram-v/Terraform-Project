resource "aws_kms_key" "my_s3_kms_key" {
  description             = var.key_description 
  enable_key_rotation     = true
  deletion_window_in_days = var.deletion_window_in_days 

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::523727612337:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
}
