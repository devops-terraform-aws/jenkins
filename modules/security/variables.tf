variable "name" {
  type = string
}

variable "tags" {
  type = object({
    Name = string
  })
}