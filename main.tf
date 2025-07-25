# main.tf

resource "aws_s3_bucket" "artifacts" {
  bucket = "devops-masters-artifacts-sonali"

  tags = {
    Name = "CodePipeline Artifacts Bucket"
  }
}

