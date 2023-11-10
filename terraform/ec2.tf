resource "aws_instance" "my_ec2"{
    ami= "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    key_name = aws_key_pair.newkeypair.key_name
    tags = {
        Name = "ubuntu"
    }
}