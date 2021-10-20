output "combiner-fip" {
  description = "The floating IP of the combiner instance"
  value       = module.combiner.floating_ip
}

output "reducer-fip" {
  description = "The floating IP of the reducer instance"
  value       = module.reducer.floating_ip
}

