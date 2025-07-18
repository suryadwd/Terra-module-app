#key pair
resource aws_key_pair my_key{
  key_name = "${var.env}-infra-app-key"
  public_key = file("ec2-key.pub")
  tags = {
    Environment = var.env
  }
} 

#VPC and  security group

resource aws_default_vpc default {}


resource aws_security_group my_security_group {
    name = "${var.env}-infra-app-group"
    description = "using tf we are adding the vpc and security group which are added during the creation of ec2 instances automatically"
    vpc_id = aws_default_vpc.default.id # this is known as interpolation
    

    #inbound rules
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }
    ingress{
        from_port = 7000
        to_port = 7000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "server open"
    }

    #outbound rules
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"         
        cidr_blocks = ["0.0.0.0/0"]
        description = "outbound open to all "
    }
    tags = {
        Name = "${var.env}-infra-app-group"   
    }
}


resource "aws_instance" "my_instance"{
    key_name = aws_key_pair.my_key.key_name
    count = var.instance_count
    depends_on = [ aws_security_group.my_security_group]
    security_groups = [aws_security_group.my_security_group.name]    # check kro isko ek baar 
    instance_type = var.instance_type
    ami = var.ami
    root_block_device {
        volume_size = var.env == "prod" ? 25 : var.default_storage_size
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-infra-app-instance"
        Environment = var.env
    }
}


