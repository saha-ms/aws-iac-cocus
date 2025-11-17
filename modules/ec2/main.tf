resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  vpc_security_group_ids = var.security_group_ids

  tags = merge(var.tags, {
    Name        = "${var.name_prefix}-web-${count.index}"
    Environment = var.environment
  })
}
