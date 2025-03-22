output "remote_state_bucket" {
  value = module.remote_state.remote_state_bucket
}

output "dynamo_table" {
  value = module.remote_state.dynamo_table
}
