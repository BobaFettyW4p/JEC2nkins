variable "region" {
  description = "The AWS region resources reside in."
  default     = "us-east-2"
}

variable "ami" {
  description = "The AMI to use for the instance."
  default     = "ami-05bfbece1ed5beb54"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone."
  default     = "mivancic.com"
}