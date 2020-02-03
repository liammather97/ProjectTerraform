resource "aws_security_group" "public" {
    name = "Public"
    description = "Public security group"
    vpc_id = var.vpc_id

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_ports
        content {
            from_port = port.value
            protocol = "tcp"
            to_port = port.value
            cidr_blocks = var.open_internet
        }
    }

    egress {
        from_port = var.outbound_port
            protocol = "-1"
            to_port = var.outbound_port
            cidr_blocks = var.open_internet
    }
}

resource "aws_security_group" "private" {
    name = "Private"
    description = "Private security group"
    vpc_id = var.vpc_id

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_ports
        content {
            from_port = port.value
            protocol = "tcp"
            to_port = port.value
            cidr_blocks = var.open_internet
        }
    }

    egress {
        from_port = var.outbound_port
            protocol = "-1"
            to_port = var.outbound_port
            cidr_blocks = var.open_internet
    }
}