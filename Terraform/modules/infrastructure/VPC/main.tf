resource "aws_vpc" "main" {
    cidr_block  = "10.0.0.0/16"
    availability_zone = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

}

resource "aws_internet_gateway" "main" {
     vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "${var.open_internet}"
        gateway_id = "${aws_internet_gateway.main.id}"
    }
}