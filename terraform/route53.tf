resource "aws_route53_zone" "jenkins" {
  name = "jEC2nkins.${var.domain_name}"
}

resource "aws_route53_record" "jenkins" {
  zone_id = aws_route53_zone.jenkins.zone_id
  name    = "jEC2nkins.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ec2.public_ip]
}

resource "aws_route53_record" "www-jenkins" {
  zone_id = aws_route53_zone.jenkins.zone_id
  name    = "www.jEC2nkins.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ec2.public_ip]
}