# Backend MinIO
terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
    access_key = "admin"
    secret_key = "password"
    endpoint = "http://minio.kravets.home:9000"
    skip_credentials_validation = true
    force_path_style = true
  }
}

# Configure the GitLab Provider
provider "gitlab" {
  base_url = var.gitlab_url
  token    = var.gitlab_token
}

# Locals
locals {
  name = "wa-${var.project_name}"
}

# resource
resource "gitlab_group" "wa_basic_group" {
  name        = local.name
  path        = local.name
  description = "${local.name} group"
}

# Create a project in wa_basic_group group
resource "gitlab_project" "wa_basic_group" {
  name         = "Project ${local.name}"
  description  = var.project_name
  namespace_id = gitlab_group.wa_basic_group.id
}