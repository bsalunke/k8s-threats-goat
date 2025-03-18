# Image name and registry settings
IMAGE_PREFIX ?= k8s-threats-goat
IMAGE_NAME ?= command-execution-using-kubectl
DOCKER_REGISTRY ?= your-dockerhub-username
BUILD_TOOL ?= podman
TAG ?= latest

# Kubernetes deployment file
DEPLOYMENT_FILE ?= deploy.yaml

# Derived full image name
FULL_IMAGE_NAME := localhost/$(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME):$(TAG)

# Build the Docker image
build:
	$(BUILD_TOOL)  build --platform linux/amd64 -t $(FULL_IMAGE_NAME) .

# Push the image to a registry
push:
	podman tag $(FULL_IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME):$(TAG)
	podman push $(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME):$(TAG)

# Deploy the threat scenario to Kubernetes
deploy:
	kubectl apply -f $(DEPLOYMENT_FILE)

# Clean up deployment
clean:
	kubectl delete -f $(DEPLOYMENT_FILE)

# Build, push, and deploy all at once
all: build push deploy

.PHONY: build push deploy clean all
