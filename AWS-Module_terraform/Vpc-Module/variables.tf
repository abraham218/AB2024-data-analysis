variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of CIDR blocks for private subnets"
  type        = list(string)
}
