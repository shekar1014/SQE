provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}
resource "aws_vpc" "first_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}"
  }
}
resource "aws_subnet" "first_subnet" {
  vpc_id     = "${aws_vpc.first_vpc.id}"
  cidr_block = "${var.subnet_cidr_1}"
  availability_zone = "${var.azs}"

  tags = {
      Name = "${var.subnet_1}"
  }
}
resource "aws_subnet" "second_subnet" {
  vpc_id     = "${aws_vpc.first_vpc.id}"
  cidr_block = "${var.subnet_cidr_2}"
  availability_zone = "${var.azs}"

  tags = {
      Name = "${var.subnet_2}"
  }
}

terraform {
  backend "s3" {
    bucket = "ttestbuckett"
    key    = "mytestfile"
    region = "us-east-1"
  }
}


