terraform {
    backend "s3" {
      bucket = "terrafom-state-bucket01-xcasdfsdq"
      key = "finance/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "state-locking"
    }
}