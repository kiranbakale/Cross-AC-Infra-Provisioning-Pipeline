terraform {
  backend "s3" {
    bucket         = "bucket-name-created-manually"
    key            = "your/tfstatefolder/folder/terraform.tfstate"
    dynamodb_table = "DynamoDB-name-created-manually"
    region         = "your-region-code"
    encrypt        = true
  }
}




