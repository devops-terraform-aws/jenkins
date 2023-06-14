output "export_key_name" {
  value = aws_key_pair.deployer.key_name
}

output "export_private_key" {
  value = tls_private_key.key.private_key_pem
}