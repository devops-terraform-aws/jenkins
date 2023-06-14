variable "instance_type" {
  type = string

  validation {
    condition     = var.instance_type != "t2.small"
    error_message = "Instance must be t2.medium or above"
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