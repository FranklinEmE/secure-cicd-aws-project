resource "aws_vpc" "core" {
  cidr_block           = "10.50.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "aurora-vpc-x9q7"
  }
}

resource "aws_subnet" "public_one" {
  vpc_id                  = aws_vpc.core.id
  cidr_block              = "10.50.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "aurora-public-1-x9q7"
  }
}

resource "aws_subnet" "public_two" {
  vpc_id                  = aws_vpc.core.id
  cidr_block              = "10.50.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "aurora-public-2-x9q7"
  }
}

resource "aws_subnet" "private_one" {
  vpc_id            = aws_vpc.core.id
  cidr_block        = "10.50.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "aurora-private-1-x9q7"
  }
}

resource "aws_subnet" "private_two" {
  vpc_id            = aws_vpc.core.id
  cidr_block        = "10.50.11.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "aurora-private-2-x9q7"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.core.id

  tags = {
    Name = "aurora-igw-x9q7"
  }
}

resource "aws_eip" "nat_ip" {
  domain = "vpc"

  tags = {
    Name = "aurora-eip-x9q7"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_one.id

  tags = {
    Name = "aurora-nat-x9q7"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.core.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "aurora-public-rt-x9q7"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.core.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "aurora-private-rt-x9q7"
  }
}

resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.public_one.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.public_two.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "priv1" {
  subnet_id      = aws_subnet.private_one.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "priv2" {
  subnet_id      = aws_subnet.private_two.id
  route_table_id = aws_route_table.private_rt.id
}


