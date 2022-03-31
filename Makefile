SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -upgrade && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/account init -upgrade && $(TERRAFORM) -chdir=modules/account validate  && \
		$(TERRAFORM) -chdir=modules/application-autoscaling init -upgrade && $(TERRAFORM) -chdir=modules/application-autoscaling validate  && \
		$(TERRAFORM) -chdir=modules/cloudformation init -upgrade && $(TERRAFORM) -chdir=modules/cloudformation validate  && \
		$(TERRAFORM) -chdir=modules/codebuild init -upgrade && $(TERRAFORM) -chdir=modules/codebuild validate  && \
		$(TERRAFORM) -chdir=modules/codedeploy init -upgrade && $(TERRAFORM) -chdir=modules/codedeploy validate  && \
		$(TERRAFORM) -chdir=modules/codepipeline init -upgrade && $(TERRAFORM) -chdir=modules/codepipeline validate  && \
		$(TERRAFORM) -chdir=modules/ec2 init -upgrade && $(TERRAFORM) -chdir=modules/ec2 validate  && \
		$(TERRAFORM) -chdir=modules/ecs-tasks init -upgrade && $(TERRAFORM) -chdir=modules/ecs-tasks validate  && \
		$(TERRAFORM) -chdir=modules/edgelambda init -upgrade && $(TERRAFORM) -chdir=modules/edgelambda validate  && \
		$(TERRAFORM) -chdir=modules/events init -upgrade && $(TERRAFORM) -chdir=modules/events validate  && \
		$(TERRAFORM) -chdir=modules/lambda init -upgrade && $(TERRAFORM) -chdir=modules/lambda validate  && \
		$(TERRAFORM) -chdir=modules/spotfleet init -upgrade && $(TERRAFORM) -chdir=modules/spotfleet validate && \
		$(TERRAFORM) -chdir=modules/logs init -upgrade && $(TERRAFORM) -chdir=modules/logs validate

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
		$(TERRAFORM) fmt -list=true ./modules/spotfleet && \
		$(TERRAFORM) fmt -list=true ./modules/logs

release: test
	git tag $(VERSION) && git push --tags
