resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidrs[2]
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 3"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = "us-west-2a"
  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = "us-west-2b"
  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[2]
  availability_zone = "us-west-2c"
  tags = {
    Name = "Private Subnet 3"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
}