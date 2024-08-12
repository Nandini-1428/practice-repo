provider "aws" {
        region = "ap-south-1"
}

resource "aws_instance" "server" {
        ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.medium"
        availability_zone = "ap-south-1a"
        tags = {
                Name = "Staging-Env"
        }
}

resource "aws_s3_bucket" "s3_bucket" {
        bucket = "nandini-s3-state-bucket-abc"
}
resource "aws_s3_bucket_versioning" "s3bucket-version" {
        bucket = aws_s3_bucket.s3_bucket.id
        versioning_configuration {
                status = "Enabled"
        }
}
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}



 
