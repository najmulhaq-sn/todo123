resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "internet-gateway"
  }
  depends_on = [aws_vpc.main]
}


### Route tables for internet gateway ###

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${var.environment}-${element(var.availability_zones, 0)}-public-route-table"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id

  depends_on = [aws_subnet.public_subnet]
}
