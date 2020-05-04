variable "principals" {
  description = "A map of commonly used role principals"
  type        = map(list(string))
  default = {
    application-autoscaling = ["application-autoscaling.amazonaws.com", "Service"]
    cloudformation          = ["cloudformation.amazonaws.com", "Service"]
  }
}
