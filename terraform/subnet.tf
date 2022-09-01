/* public subnet */  
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.1.0/24"
  map_public_ip_on_launch = true
  
  depends_on = [aws_vpc.main]
}

/* private subnet  */

resource "aws_subnet" "private_subnet" {
  vpc_id          = aws_vpc.main.id
  cidr_block      = "172.31.2.0/24"

  depends_on = [aws_vpc.main]
}