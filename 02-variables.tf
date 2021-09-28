variable "region" {
  default     = "ap-south-1"
  description = "AWS Region"
}

# tagging
variable "prefix" {
    default = "proj-short-name"
}

variable "project" {
    default = "projectname"
}

variable "contact" {
    default = "rpanwar@msystechnologies.com"
}

variable "environment" {
  description = "environment"
}


variable "remote_state_key" {}
variable "remote_state_bucket" {}
variable "ecs_cluster_name" {}
# variable "ecs_domain_name" {}
variable "internet_cidr_block" {}