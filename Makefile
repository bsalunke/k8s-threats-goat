# List of threat modules
THREATS := command-execution-using-kubectl

# Default registry
DOCKER_REGISTRY ?= your-dockerhub-username
TAG ?= latest

# Build all threat images
build-all:
	for threat in $(THREATS); do \
		$(MAKE) -C threats/$$threat build DOCKER_REGISTRY=$(DOCKER_REGISTRY) TAG=$(TAG); \
	done

# Push all images
push-all:
	for threat in $(THREATS); do \
		$(MAKE) -C threats/$$threat push DOCKER_REGISTRY=$(DOCKER_REGISTRY) TAG=$(TAG); \
	done

# Deploy all threat scenarios
deploy-all:
	for threat in $(THREATS); do \
		$(MAKE) -C threats/$$threat deploy; \
	done

# Cleanup all threats
clean-all:
	for threat in $(THREATS); do \
		$(MAKE) -C threats/$$threat clean; \
	done

# Full pipeline (build, push, deploy)
all: build-all push-all deploy-all

.PHONY: build-all push-all deploy-all clean-all all

