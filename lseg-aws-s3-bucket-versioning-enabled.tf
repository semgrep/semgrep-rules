resource "aws_s3_bucket" "fail" {
  bucket = "my-new-bucket"
}

resource "aws_s3_bucket" "fail" {
  bucket = "my-new-bucket"
}

resource "aws_s3_bucket" "fail" {
  bucket = "my-new-bucket"
    versioning = {
      status = false
  }
}

resource "aws_s3_bucket" "pass" {
  bucket = "my-new-bucket"
  
  versioning = {
      status = true
  }
}
