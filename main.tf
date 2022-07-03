provider "aws" {

      region     = "${var.region}"

     
}

resource "aws_vpc" "vpc" {

     cidr_block = "10.40.0.0/16"

}

resource "aws_internet_gateway" "gateway" {

     vpc_id = "${aws_vpc.vpc.id}"

}

resource "aws_route" "route" {

     route_table_id         = "${aws_vpc.vpc.main_route_table_id}"

     destination_cidr_block = "0.0.0.0/0"

     gateway_id             = "${aws_internet_gateway.gateway.id}"

}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "main" {

    count                   = "${length(data.aws_availability_zones.available.names)}"

    vpc_id                  = "${aws_vpc.vpc.id}"

    cidr_block              = "10.40.${count.index}.0/24"

    map_public_ip_on_launch = true

    availability_zone       = "${element(data.aws_availability_zones.available.names, count.index)}"

}

resource "aws_security_group" "default" {

     name        = "http-https-allow"

     description = "Allow incoming HTTP and HTTPS"

     vpc_id      = "${aws_vpc.vpc.id}"

     ingress {

         from_port = 80

         to_port = 80

         protocol = "tcp"

         cidr_blocks = ["0.0.0.0/0"]

    }

     ingress {

         from_port = 443

         to_port = 443

         protocol = "tcp"

         cidr_blocks = ["0.0.0.0/0"]

    }

}