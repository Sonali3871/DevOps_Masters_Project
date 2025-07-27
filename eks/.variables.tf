variable "region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "devops-cluster"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
