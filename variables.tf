variable "region" {
  type = string
  description = "region of your instance"
}

variable "iam_role_name" {
   type = string
   description = "name of iam  role"
}

variable "key_description" {
   type = string
   description = "AWS KMS key description"
  
}

variable "deletion_window_in_days" {
   type = number
   description = "waiting period for key deletion"
}

variable "first_bucket_name" {
   type = any
   description = "first S3 bucket name"
}

variable "acl" {
  type = string
  description = "Access Control List"
}

variable "status" {
  type = string
}

variable "sse_algorithm" {
    type = string
    description = "server-side encryption"
  
}

variable "target_prefix" {
    type = string
    description = "log/ prefix"
  
}

variable "id" {
  type = string
  description = "lifecycle configuration rule id"
}

variable "days_after_initiation" {
  type = any
  description = "aborting incomplete multipart uploads"
}

variable "effect" {
  type = string
  description = "iam policy statment effect"
}

variable "type" {
  type = string
  description = "iam policy principals type"
}

variable "identifiers" {
  type = list(string)
  description = "iam policy principals type"
}

variable "actions" {
 type = list(string)
  description = "iam policy actions" 
}

variable "resources" {
  type = list(string)
  description = "iam policy resources"
}

variable "condition_test" {
  type = string
  description = "iam policy condition test"
}

variable "condition_variable" {
  type = string
  description = "iam policy condition variable"
}

variable "sns_topic_name" {
  type = string
  description = "sns topic name"
}

variable "protocol" {
  type = string
  description = "email subscription protocol"
}

variable "endpoint" {
  type = string
  description = "email subscription endpoint"
}

variable "bucket_notification_events" {
  type = list(string)
  description = "S3 bucket notifification events"
}

variable "second_bucket_name" {
  type = any
  description = "second S3 bucket name"
}

variable "storage_class" {
  type = string
  description = "S3 bucket replication destination storage class"
}

