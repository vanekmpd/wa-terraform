# Provider vars
variable "gitlab_url" {
  description = "Gitlab Server url"
  type        = string
  default     = "http://gitlab.kravets.home/api/v4"
}

variable "gitlab_token" {
  description = "Gitlab Token"
  type        = string
  sensitive   = true
  default     = "DGfpSrVKng9C_VggpUC2"
}

variable "project_name" {
    description = "Onboard project name"
    type = string  
}