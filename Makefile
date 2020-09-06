SHELL:=/bin/bash
TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

TERRAFORM_DOCS=docker run --rm -v "${PWD}:/work" tmknom/terraform-docs

CHECKOV=docker run -t -v "${PWD}:/work" bridgecrew/checkov

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/account && $(TERRAFORM) validate modules/account  && \
		$(TERRAFORM) init modules/application-autoscaling && $(TERRAFORM) validate modules/application-autoscaling  && \
		$(TERRAFORM) init modules/cloudformation && $(TERRAFORM) validate modules/cloudformation  && \
		$(TERRAFORM) init modules/codebuild && $(TERRAFORM) validate modules/codebuild  && \
		$(TERRAFORM) init modules/codedeploy && $(TERRAFORM) validate modules/codedeploy  && \
		$(TERRAFORM) init modules/codepipeline && $(TERRAFORM) validate modules/codepipeline  && \
		$(TERRAFORM) init modules/ec2 && $(TERRAFORM) validate modules/ec2  && \
		$(TERRAFORM) init modules/ecs-tasks && $(TERRAFORM) validate modules/ecs-tasks  && \
		$(TERRAFORM) init modules/edgelambda && $(TERRAFORM) validate modules/edgelambda  && \
		$(TERRAFORM) init modules/events && $(TERRAFORM) validate modules/events  && \
		$(TERRAFORM) init modules/lambda && $(TERRAFORM) validate modules/lambda  && \
		$(TERRAFORM) init modules/spotfleet && $(TERRAFORM) validate modules/spotfleet

test: validate
	$(CHECKOV) -d /work && \
		$(CHECKOV) -d /work/modules/account && \
		$(CHECKOV) -d /work/modules/application-autoscaling && \
		$(CHECKOV) -d /work/modules/cloudformation && \
		$(CHECKOV) -d /work/modules/codebuild && \
		$(CHECKOV) -d /work/modules/codedeploy && \
		$(CHECKOV) -d /work/modules/codepipeline && \
		$(CHECKOV) -d /work/modules/ec2 && \
		$(CHECKOV) -d /work/modules/ecs-tasks && \
		$(CHECKOV) -d /work/modules/edgelambda && \
		$(CHECKOV) -d /work/modules/events && \
		$(CHECKOV) -d /work/modules/lambda && \
		$(CHECKOV) -d /work/modules/spotfleet

docs:
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/account >./modules/account/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/application-autoscaling >./modules/application-autoscaling/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/cloudformation >./modules/cloudformation/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/codebuild >./modules/codebuild/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/codedeploy >./modules/codedeploy/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/codepipeline >./modules/codepipeline/README.md   && \
		$(TERRAFORM_DOCS) markdown ./modules/ec2 >./modules/ec2/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/ecs-tasks >./modules/ecs-tasks/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/edgelambda >./modules/edgelambda/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/events >./modules/events/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/lambda >./modules/lambda/README.md  && \
		$(TERRAFORM_DOCS) markdown ./modules/spotfleet >./modules/spotfleet/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/account  && \
		$(TERRAFORM) fmt -list=true ./modules/application-autoscaling  && \
		$(TERRAFORM) fmt -list=true ./modules/cloudformation  && \
		$(TERRAFORM) fmt -list=true ./modules/codebuild  && \
		$(TERRAFORM) fmt -list=true ./modules/codedeploy  && \
		$(TERRAFORM) fmt -list=true ./modules/codepipeline  && \
		$(TERRAFORM) fmt -list=true ./modules/ec2  && \
		$(TERRAFORM) fmt -list=true ./modules/ecs-tasks  && \
		$(TERRAFORM) fmt -list=true ./modules/edgelambda  && \
		$(TERRAFORM) fmt -list=true ./modules/events  && \
		$(TERRAFORM) fmt -list=true ./modules/lambda  && \
		$(TERRAFORM) fmt -list=true ./modules/spotfleet
