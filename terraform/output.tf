output "key_name" {
  value = aws_key_pair.newkeypair.key_name
}
output "vpci_id" {
    value = aws_vpc.my_vpc.id   
}
output "sg_name" {
    value = aws_security_group.new_sg.name
  
}