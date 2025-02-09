resource "aws_route53_record" "expense" {
  count = 3
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records =  [var.instances[count.index] == "frontend" && var.environment == "prod" ?  aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
}