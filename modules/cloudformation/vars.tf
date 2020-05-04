variable "name" {
  description = "IAM role name"
}

variable "description" {
  description = "IAM role description"
}

variable "path" {
  description = "The path applied to the IAM role"
  default     = "/"
}

variable "principal" {
  description = "Identifier for the role principal"
}

variable "policies" {
  description = "A list of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}
