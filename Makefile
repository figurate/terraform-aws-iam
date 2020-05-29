SHELL:=/bin/bash
TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

test:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/account && $(TERRAFORM) validate modules/account
		$(TERRAFORM) init modules/application-autoscaling && $(TERRAFORM) validate modules/application-autoscaling
		$(TERRAFORM) init modules/cloudformation && $(TERRAFORM) validate modules/cloudformation
		$(TERRAFORM) init modules/codebuild && $(TERRAFORM) validate modules/codebuild
		$(TERRAFORM) init modules/codedeploy && $(TERRAFORM) validate modules/codedeploy
		$(TERRAFORM) init modules/codepipeline && $(TERRAFORM) validate modules/codepipeline
		$(TERRAFORM) init modules/ec2 && $(TERRAFORM) validate modules/ec2
		$(TERRAFORM) init modules/ecs-tasks && $(TERRAFORM) validate modules/ecs-tasks
		$(TERRAFORM) init modules/edgelambda && $(TERRAFORM) validate modules/edgelambda
		$(TERRAFORM) init modules/events && $(TERRAFORM) validate modules/events
		$(TERRAFORM) init modules/lambda && $(TERRAFORM) validate modules/lambda
		$(TERRAFORM) init modules/spotfleet && $(TERRAFORM) validate modules/spotfleet

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/account >./modules/account/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/application-autoscaling >./modules/application-autoscaling/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/cloudformation >./modules/cloudformation/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/codebuild >./modules/codebuild/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/codedeploy >./modules/codedeploy/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/codepipeline >./modules/codepipeline/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/ec2 >./modules/ec2/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/ecs-tasks >./modules/ecs-tasks/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/edgelambda >./modules/edgelambda/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/events >./modules/events/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/lambda >./modules/lambda/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/spotfleet >./modules/spotfleet/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/account
		$(TERRAFORM) fmt -list=true ./modules/application-autoscaling
		$(TERRAFORM) fmt -list=true ./modules/cloudformation
		$(TERRAFORM) fmt -list=true ./modules/codebuild
		$(TERRAFORM) fmt -list=true ./modules/codedeploy
		$(TERRAFORM) fmt -list=true ./modules/codepipeline
		$(TERRAFORM) fmt -list=true ./modules/ec2
		$(TERRAFORM) fmt -list=true ./modules/ecs-tasks
		$(TERRAFORM) fmt -list=true ./modules/edgelambda
		$(TERRAFORM) fmt -list=true ./modules/events
		$(TERRAFORM) fmt -list=true ./modules/lambda
		$(TERRAFORM) fmt -list=true ./modules/spotfleet
