resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = aws_vpc_ipam_pool_cidr.cidr_pool.cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
}