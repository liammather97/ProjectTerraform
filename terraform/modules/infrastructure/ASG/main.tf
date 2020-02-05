resource "aws_launch_configuration" "main" {
    image_id = var.ami
    instance_type = var.instance_type
    key_name = "${var.key_name}"
    user_data = "${file("${var.bootstrap_path}")}"
    security_groups = ["${var.security_groups}"]

    lifecycle {
        create_before_destroy = true
    }
    provisioner "file" {
      source      = "../../modules/infrastructure/worker-token.txt"
      destination = "/etc/worker-token.txt"
    }
    provisioner "remote-exec" {
      inline = [
        "$(cat /etc/worker-token.txt)"
      ]
    }
}

resource "aws_autoscaling_group" "main" {
    launch_configuration = aws_launch_configuration.main.id
    availability_zones = ["eu-west-2a", "eu-west-2b","eu-west-2c"]
    min_size = 1
    max_size = 4

    vpc_zone_identifier=[var.subnetid]

}
