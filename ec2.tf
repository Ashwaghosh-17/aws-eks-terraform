resource "aws_instance" "bastion" {

  ami = "ami-0bc7aabcf58d1e02a"

  instance_type = "t3.small"

  subnet_id = module.vpc.public_subnets[0]

  associate_public_ip_address = true

  tags = {
    Name = "Bastion"
  }
}