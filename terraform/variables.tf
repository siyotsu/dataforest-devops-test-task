variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
  nullable    = false
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  nullable    = false
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
  nullable    = false
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "us-east-1a"
  nullable    = false
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for the public subnet"
  type        = bool
  default     = true
  nullable    = false
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01edd5711cfe3825c"
  nullable    = false
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
  nullable    = false
}

variable "cf_orgin_id" {
  description = "Origin ID for CloudFront distribution"
  type        = string
  default     = "ec2-origin"
  nullable    = false
}

variable "default_root_object" {
  description = "Default root object for CloudFront distribution"
  type        = string
  default     = "index.html"
  nullable    = false
}