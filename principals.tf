locals {
  principals = {
    application-autoscaling = ["application-autoscaling.amazonaws.com", "Service"]
    cloudformation          = ["cloudformation.amazonaws.com", "Service"]
    ec2                     = ["ec2.amazonaws.com", "Service"]
    ecs-tasks               = ["ecs-tasks.amazonaws.com", "Service"]
    edgelambda              = ["edgelambda.amazonaws.com", "Service"]
    lambda                  = ["lambda.amazonaws.com", "Service"]
    root                    = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root", "AWS"]
  }
}
