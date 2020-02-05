output "public-ip" {
    value = aws_instance.master.public_ip
}