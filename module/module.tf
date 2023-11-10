module "custome_vpc"{
    source = "./vpc"
    vpc_cidr_block = "199.0.0.0/24"
    public_subnet_cidr_block = "199.0.0.0/25"
    private_subnet_cidr_block = "199.0.0.128/25" 
}
module "security_group"{
    source = "./security_group"
    vpc_id = module.custome_vpc.vpc_id
}
module "key_pair" {
    source = "./key_pair"
    key_name = "pem_key"
  
}

module "ec2" {
    source = "./ec2"
    instance_ami = "ami-0a7cf821b91bcccbc"
    key_name = module.key_pair.key_name
    subnet_id = module.custome_vpc.public_subnet_id
  
}