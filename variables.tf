variable "access_key" {
     description = "Access key to AWS console"
     type = "string"
}
variable "secret_key" {
     description = "Secret key to AWS console"
     type = "string"
}
variable "region" {
     description = "Region of AWS"
     type    = "string"
     default = "eu-south-2"
}

variable "bucket_name" {
  description = "Creates a unique bucket name"
  type        = "string"
  default     = "test-bucket"
}

