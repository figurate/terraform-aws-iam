SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init  && $(TERRAFORM) validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

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
		$(TERRAFORM_DOCS) markdown ./modules/spotfleet >./modules/spotfleet/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/logs >./modules/logs/README.md

format:
	$(TERRAFORM) fmt -list=true -recursive

release: test
	git tag $(VERSION) && git push --tags
