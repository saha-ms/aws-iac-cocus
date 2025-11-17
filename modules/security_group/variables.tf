variable "vpc_id" {
  description = "VPC ID to associate with the security group"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming the security group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
}
