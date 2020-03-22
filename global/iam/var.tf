variable "user_names" {
  description = "Create IAM user with these names"
  type        = list(string)
  default     = ["neo", "morpheus", "trinity"]
}

variable "neo_full_access" {
  description = "If true, neo gets full access to cloudwatch"
  type        = bool
}
