

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}"
  region = "${var.region}"
  acl    = "private"

  versioning {
    enabled = true
  }
}

data "aws_iam_policy_document" "s3_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
  
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
      }
    }
}
  
resource "aws_iam_role" "s3_bucket" {
  name = "s3_role"
    
  assume_role_policy = data.aws_iam_policy_document.s3_assume_role_policy.json

  policy = jsonencode({
        {
          "Version": "2012-10-17",
           "Statement": [
           {
              "Sid": "PublicReadGetObject",
              "Effect": "Allow",
              "Principal": { "AWS": "arn:aws:sts::AWS-account-ID:assumed-role/role-name/role-session-name" }"s3_role",
              "Action": [
                 "s3:GetObject"
               ],
              "Resource": [
                "${aws_s3_bucket.my_bucket.arn}"
               ]
            }
        ]
    }
  })
}