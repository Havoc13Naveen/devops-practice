resource "aws_vpc" "my_vpc"{
    cidr_block = "181.0.0.0/24"
    tags = {
      Name = "my_vpc"
    }
}

resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "181.0.0.0/25"
    tags ={
        Name = "my_public_subnet"
    }
}
resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "181.0.0.128/25"
    tags ={
        Name = "my_private_subnet"
    }
}
resource "aws_internet_gateway" "my_IG"{
    vpc_id = aws_vpc.my_vpc.id
    tags= {
        Name = "my_IG"
    }
}
resource "aws_route_table" "publicRT"{
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_IG.id
    }
    tags ={
        Name = "my_publicRT"
    }
}
resource "aws_route_table_association" "public_asso" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.publicRT.id
  
}
