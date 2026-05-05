variable "aws_region" {
  type        = string
  description = "Región de AWS"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
}

variable "ami" {
  type        = string
  description = "AMI de la instancia"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR del VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR de la subnet"
}

variable "availability_zone" {
  type        = string
  description = "Zona de disponibilidad"
}

variable "key_name" {
  type        = string
  description = "Nombre del key pair"
}