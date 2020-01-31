output "bucket_site_id" {
  value = "${aws_s3_bucket.site.id}"
}

output "bucket_site_domainname" {
  value = "${aws_s3_bucket.site.bucket_domain_name}"
}
