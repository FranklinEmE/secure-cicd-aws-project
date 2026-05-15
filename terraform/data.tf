data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["senior-vpc"]
  }
}

data "aws_subnet" "public_a" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet-a"]
  }
}
