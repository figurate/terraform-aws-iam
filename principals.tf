locals {
  principals = {
    account                 = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root", "AWS"]
    application-autoscaling = ["application-autoscaling.amazonaws.com", "Service"]
    cloudformation          = ["cloudformation.amazonaws.com", "Service"]
    codebuild               = ["codebuild.amazonaws.com", "Service"]
    codedeploy              = ["codedeploy.amazonaws.com", "Service"]
    codepipeline            = ["codepipeline.amazonaws.com", "Service"]
    ec2                     = ["ec2.amazonaws.com", "Service"]
    ecs                     = ["ecs.amazonaws.com", "Service"]
    ecs-tasks               = ["ecs-tasks.amazonaws.com", "Service"]
    edgelambda              = ["edgelambda.amazonaws.com", "Service"]
    events                  = ["events.amazonaws.com", "Service"]
    lambda                  = ["lambda.amazonaws.com", "Service"]
    spotfleet               = ["spotfleet.amazonaws.com", "Service"]
    logs                    = ["logs.amazonaws.com", "Service"]
  }
}
