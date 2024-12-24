variable "region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "node_type" {
  description = "The node type to use for the Redis cluster"
  type        = string
  default     = "cache.t2.micro"
}