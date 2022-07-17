variable "region" {

  default = "us-east-1"

}
variable "bucket_name" {
  default = "fernandomirandas3"
}


variable "ami" {
  type    = string
  default = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

