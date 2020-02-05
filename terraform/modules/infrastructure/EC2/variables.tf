variable "ami" {
  }
variable "public_subnet_id" {
}
variable "securitygroup" {
  
}
variable "vpc_id" {
  
}
variable "instance_type" {
  description = "Instance type"
  default = "t2.medium"
}
variable "key_path" {
  description = "SSH Public Key path"
  default = "./docker-key.pem"
}
variable "key_name" {
  description = "Keypair..."
  default = "docker-key"
}
variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "../../modules/infrastructure/install_docker_machine_compose.sh"
}

