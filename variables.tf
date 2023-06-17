variable "instance_type" {
  type = string

  validation {
    condition     = var.instance_type != "t2.micro"
    error_message = "Instance must be t2.micro or above"
  }
}

variable "tags" {
  type = object({
    Name = string
  })
}

variable "name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "region" {
  type = string
}