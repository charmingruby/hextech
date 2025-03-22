module "container" {
  source = "./modules/container"
  tags   = local.tags
}

module "pipeline" {
  source = "./modules/pipeline"
  tags   = local.tags
}
