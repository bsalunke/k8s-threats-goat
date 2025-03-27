# Image names and registry settings
IMAGE_NAME_GCC ?= gcc
IMAGE_NAME_GO ?= go
IMAGE_NAME_JAVA ?= java
DOCKER_REGISTRY ?= bsalunke
TAG ?= latest
NAMESPACE ?= compiler-threat
BUILD_TOOL ?= podman
IMAGE_PREFIX ?= k8s-threats-goat_
IMAGE_PREFIX :=$(IMAGE_PREFIX)$(notdir $(patsubst %/, %, $(CURDIR)))

# Derived full image names
FULL_IMAGE_NAME_GCC := $(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME_GCC):$(TAG)
FULL_IMAGE_NAME_GO := $(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME_GO):$(TAG)
FULL_IMAGE_NAME_JAVA := $(DOCKER_REGISTRY)/$(IMAGE_PREFIX)_$(IMAGE_NAME_JAVA):$(TAG)

# Kubernetes deployment file
DEPLOYMENT_FILE ?= deploy.yaml

# Build the Docker images
build:
	$(BUILD_TOOL) build -t $(FULL_IMAGE_NAME_GCC) -f Dockerfile.gcc .
	$(BUILD_TOOL) build -t $(FULL_IMAGE_NAME_GO) -f Dockerfile.go .
	$(BUILD_TOOL) build -t $(FULL_IMAGE_NAME_JAVA) -f Dockerfile.java .

# Push the images to a registry
push:
	$(BUILD_TOOL) push $(FULL_IMAGE_NAME_GCC)
	$(BUILD_TOOL) push $(FULL_IMAGE_NAME_GO)
	$(BUILD_TOOL) push $(FULL_IMAGE_NAME_JAVA)

# Deploy the threat scenario to Kubernetes
deploy:
	kubectl create namespace $(NAMESPACE) || true
	kubectl apply -f $(DEPLOYMENT_FILE) -n $(NAMESPACE)

launch: 
	./launch-threat.sh

# Clean up deployment
clean:
	kubectl delete -f $(DEPLOYMENT_FILE) -n $(NAMESPACE)

# Build, push, and deploy all at once
all: build push deploy launch 

.PHONY: build push deploy clean all

