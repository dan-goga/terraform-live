provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"
  password          = var.db_password
  skip_final_snapshot = true
}

# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }

terraform {
  backend "s3" {
    # Use your bucket name with uniq id
    bucket = "goga-bucket-for-terraform"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
    # User your dynamodb name with uniq is
    dynamodb_table = "goga-terraform-locks"
    encrypt        = true
  }
}
