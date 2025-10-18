resource "aws_security_group" "insecure_sg" {
  name        = "insecure-web-server-sg"
  description = "Permite acesso Web e SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["200.50.100.100/32"]     # <-- Acesso irrestrito
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["200.50.100.100/32"]     # <-- Porta 22 aberta para todos
  }
}

