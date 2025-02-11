variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string

}

variable "github_owner" {
  description = "GitHub username "
  type        = string
}

variable "repository_name" {
  description = "GitHub repository name"
  type        = string

}

variable "repository_description" {
  description = "GitHub repository description"
  type        = string
  default     = "Repository created via Terraform"
}
