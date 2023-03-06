resource "aws_route53_zone" "jenkins" {
    name = "jenkins.${var.domain_name}"
}

resource "aws_route53_record" "jenkins" {
    zone_id = aws_route53_zone.jenkins.zone_id
    name = "jenkins.${var.domain_name}"
    type = "A"
    ttl = "300"
    records = [aws_instance.ec2.public_ip]
}

resouce "aws_route53_record" "www-jenkins" {
    zone_id = aws_route53_zone.jenkins.zone_id
    name = "www.jenkins.${var.domain_name}"
    type = "A"
    ttl = "300"
    records = [aws_instance.ec2.public_ip]
}