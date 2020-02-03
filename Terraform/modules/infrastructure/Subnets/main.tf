resource "aws_subnet" "public_subnet" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = ["eu-west-2a", "eu-west-2b","eu-west-2c"]

    tags = {
        Name = "Public-Subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "Private-Subnet"
    }
}