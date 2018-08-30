REGISTRY=docker.io
IMAGE_OWNER=oconnormi
IMAGE_NAME=dind-maven
GIT_BRANCH:=$(shell git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,' 2>/dev/null)
ifneq (${GIT_BRANCH}, master)
	IMAGE_TAG=${GIT_BRANCH}
else
	IMAGE_TAG=latest
endif
BUILD_TAG:=$(REGISTRY)/$(IMAGE_OWNER)/$(IMAGE_NAME):$(IMAGE_TAG)

PHONY: help
help: ## Display help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: image
image: ## Build docker image
	@echo "Building image: $(BUILD_TAG)"
	@docker build --pull -t $(BUILD_TAG) .

.PHONY: push
push: image ## Push docker image
	@echo "Pushing image: $(BUILD_TAG)"
	@docker push $(BUILD_TAG)
