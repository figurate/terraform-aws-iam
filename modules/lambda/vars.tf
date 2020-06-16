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

variable "permissions_boundary" {
  description = "ARN of a permissions boundary policy"
  default     = null
}

variable "policies" {
  description = "A list of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "A list of IAM policy ARNs to copy inline to the role"
  type        = list(string)
  default     = []
}
