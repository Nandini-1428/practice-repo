terraform {
        backend "s3" {
           bucket = "nandini-s3-state-bucket-abc"
           dynamodb_table = "terraform-state-lock-dynamo"
           region = "ap-south-1"
           key    = "nandini/terraform.tfstate"
        }
}
  
