terraform {
  backend "s3" {
    bucket = "backend.tfstate-1"
    key    = "env/terraform.tfstate"
    region = "ap-south-1"

    # Enable S3 native locking
    use_lockfile = true

    encrypt = true
  }
}