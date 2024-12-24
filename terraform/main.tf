provider "aws" {
  region = var.region
}

module "redis" {
  source = "./modules/redis"

  cluster_id      = "${terraform.workspace}-redis-cluster"
  node_type       = var.node_type
  num_cache_nodes = 1
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}