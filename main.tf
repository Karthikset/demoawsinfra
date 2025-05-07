provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_instance" "ec2_instance" {
  ami             = "ami-0c55b159cbfafe1f0"  # Replace with valid AMI ID
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.main_subnet.id
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
}
