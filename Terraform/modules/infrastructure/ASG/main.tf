resource "aws_launch_configuration" "main" {
    image_id = "${var.ami_id}"
    instance_type = "t2.micro"
    security_groups = aws_security_group.public.id

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "main" {
    launch_configuration = aws_launch_configuration.main.id
    availability_zone = ["eu-west-2a", "eu-west-2b","eu-west-2c"]
    min_size = 0
    max_size = 3
}