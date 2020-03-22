provider "aws" {
  regiont = "us-east-2"
}

modules "webserver_cluster" {
  source = "github.com/dan-goga/modules//webserver-cluster?ref=v0.0.1"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "goga-bucket-for-terraform"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"
  instance_type          = "m4.large"
  min_size               = 2
  max_size               = 10
  enable_autoscaling     = true

  custome_tags = {
    Owner      = "team-goga"
    DeployedBy = "terraform"
  }
}

