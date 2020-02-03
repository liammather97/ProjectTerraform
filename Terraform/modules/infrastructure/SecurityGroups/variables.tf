variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80]
}

variable "vpc_id" {
    description = ""

}

variable "outbound_port" {
    type = number
    description = "Outbound Port"
    default = 0
}

variable "open_internet" {
    description = "the cidr block for open internet"
    default = ["0.0.0.0/0"]
}