##Route association

resource "aws_route_table_association" "rta1" {
 subnet_id = aws_subnet.public_subnet1.id   
 route_table_id = aws_route_table.rt1.id
}
resource "aws_route_table_association" "rta2" {
 subnet_id = aws_subnet.public_subnet2.id   
 route_table_id = aws_route_table.rt1.id
}