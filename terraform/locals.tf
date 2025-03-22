locals {
  tags = {
    project     = var.project
    department  = var.department
    environment = var.environment
    managed_by  = var.managed_by
    created_at  = var.created_at
  }
}
