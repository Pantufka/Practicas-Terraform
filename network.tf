resource "aws_vpc" "test_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "test-terraform-subnet"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test-terraform-ig"
  }
}

resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test-terraform-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.test_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.test_igw.id
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_rt.id
}