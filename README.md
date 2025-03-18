# Kubernetes Threats Goat
*Kubernetes Threat Simulation for Learning & Testing*

## Overview
K8s Threats Goat is an open-source project designed to simulate security misconfigurations and vulnerabilities in Kubernetes environments. It provides a set of containerized threat scenarios for learning, testing, and detection research.

---

## Getting Started

### Prerequisites
- A running Kubernetes cluster (Minikube, KIND, or any cloud provider)
- `kubectl` installed and configured
- Docker installed for building images

### Installation

Clone the repository:
```bash
git clone https://github.com/your-org/k8s-threats-goat.git
cd k8s-threats-goat
```

### USAGE

#### Build and Push All Threat Images

```bash
make build-all
make push-all DOCKER_REGISTRY=my-dockerhub-username TAG=latest
```

####  Deploy All Threat Scenarios
```bash
make deploy-all
```

#### Clean Up All Threat Scenarios
```bash
make clean-all
```

####  Deploy a Specific Threat
Each threat is located in threats/<threat-name>/. Navigate to a specific threat directory and use its Makefile:
```bash
cd threats/command-execution-using-kubectl
make all  # Build, push, and deploy the specific threat
```

## Threat Scenarios

| Threat Name                        | Description                                                   |
|------------------------------------|---------------------------------------------------------------|
| `command-execution-using-kubectl` | Simulates a container with kubectl installed that can exec into other pods. |

