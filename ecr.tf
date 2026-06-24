resource "aws_ecr_repository" "webapp" {

  name = "webapp"

  image_scanning_configuration {
    scan_on_push = true
  }
}