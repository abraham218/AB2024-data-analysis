module "vpc" {
  source           = "./terraform-vpc-module"  #  "github.com/yourusername/terraform-modules//vpc"
  project_name     = "my-project"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source           = "./terraform-ec2-module" #  "github.com/yourusername/terraform-modules//ec2"
  project_name     = "my-project"
  ami_id           = "ami-12345678"  # Replace with your AMI ID
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.public_subnet_ids[0]  # Assuming you want to launch the instance in the first public subnet
  key_name          = "my-key-pair"  # Replace with your key pair name
}



output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}
