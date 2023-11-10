resource "aws_key_pair" "newkeypair" {
    key_name = "new_key"
    public_key = tls_private_key.new_key.public_key_openssh
  
}
resource "tls_private_key" "new_key"{
    algorithm = "RSA"
    rsa_bits = "4096"
}
resource "local_file" "tf-key" {
  content  = tls_private_key.new_key.private_key_pem
  filename = "new_key"
}