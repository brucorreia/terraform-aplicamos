resource "aws_s3_bucket_object" "site" {
  key          = "index.html"
  bucket       = "${var.bucket}"
  source       = "${var.upfile}"
  content_type = "text/html"
}
