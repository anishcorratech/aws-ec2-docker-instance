output "instance_id" {
  value = module.ec2_instance.id
}

output "instance_public_ip" {
  value = module.ec2_instance.public_ip
}
  
output "instance_elatic_ip" {
  value = aws_eip.this.public_ip
}
