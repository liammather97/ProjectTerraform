module "vpc" {
    source      = "./VPC"

    environment = var.environment
    region      = var.region
    public_subnet_id = module.subnets.public_subnet_id
    private_subnet_id = module.subnets.private_subnet_id

}

module "asg" {
    source = "./ASG"

    environment = var.environment
    region      = var.region
    ami_id      = var.ami_id
    public_subnet_id = module.subnets.public_subnet_id


}

module "ec2" {

    source = "./EC2"

    environment = var.environment
    region = var.region
    ami_id = var.ami_id
    public_subnet_id = module.subnets.public_subnet_id
    



}

module "subnets"{
    source = "./subnets"

    environment = var.environment
    region = var.region
    vpc_id = module.vpc.vpc_id

}

module "SecurityGroups" {
    source = "./SecurityGroups"

    vpc_id = module.vpc.vpc_id

}