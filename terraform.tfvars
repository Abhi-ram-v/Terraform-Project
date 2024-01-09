region = "us-east-1"

key_description = "My S3 KMS Key"

deletion_window_in_days = 30

iam_role_name = "my-replication-role"

first_bucket_name = "project-1-s3-bucket"

acl = "private"

status = "Enabled"

sse_algorithm = "aws:kms"

target_prefix = "log/"

id = "example-rule"

days_after_initiation = 7

effect = "Allow"

type = "Service"

identifiers = ["s3.amazonaws.com"]

actions = ["SNS:Publish"]

resources = ["arn:aws:sns:*:*:my-sns-topic"]

condition_test = "ArnLike"

condition_variable = "aws:SourceArn"

sns_topic_name = "my-sns-topic"

protocol =  "email"

endpoint =  "abhiramv91@gmail.com"

bucket_notification_events = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

second_bucket_name = "project-2-s3-bucket"

storage_class = "STANDARD"
