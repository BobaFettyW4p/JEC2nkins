data "aws_region" "current" {}

resource "aws_vpc_ipam" "ipam_pool" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
}

resource "aws_vpc_ipam_pool" "ipam_pool" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.ipam_pool.private_default_scope_id
  locale         = data.aws_region.current.name
}

resource "aws_vpc_ipam_pool_cidr" "cidr_pool" {
  ipam_pool_id = aws_vpc_ipam_pool.ipam_pool.id
  cidr         = "172.2.0.0/16"
}

resource "aws_vpc" "vpc" {
  cidr_block           = aws_vpc_ipam_pool_cidr.cidr_pool.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}