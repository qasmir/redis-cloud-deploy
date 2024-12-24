variable "cluster_id" {
  description = "The ID for the Redis cluster"
  type        = string
}

variable "node_type" {
  description = "The node type for the Redis cluster"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes in the Redis cluster"
  type        = number
  default     = 1
}