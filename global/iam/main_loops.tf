provider "aws" {
  region = "us-east-2"
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

output "upper_names" {
  value = [for name in var.names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

variable "heroes" {
  description = "map"
  type        = map
  default     = {
    neo       = "hero"
    trinity   = "love interest"
    morpheus  = "mentor"
  }
}

output "bios" {
  value = [for hero_name, hero_role in var.heroes : "${hero_name} is the ${hero_role}"]
}
 
output "upper_roles" {
  value = {for hero_name, hero_role in var.heroes : upper(hero_name) => upper(hero_role) }
}

