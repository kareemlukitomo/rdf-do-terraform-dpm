terraform {
  cloud {
    hostname = "app.terraform.io" # karena pakai OpenTofu, jadi perlu specify hostname
    organization = "RyakaDev"
    workspaces {
      name = "atlantis"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  required_version = ">= 1.1.0"
}


variable "name_length" {
  description = "The number of words in the pet name"
  default     = "5"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}