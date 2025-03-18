
---

### **2. README for "Command Execution Using kubectl" (`k8s-threats-goat/threats/command-execution-using-kubectl/README.md`)**
```markdown
# Command Execution Using `kubectl`
🛑 *Simulating Unauthorized Access to Other Containers Using `kubectl`*

## Overview
This scenario demonstrates how a container with `kubectl` installed can be misused to access other running containers in the same Kubernetes cluster.

---

## Setup Instructions

### 1. Build & Push the Image
```bash
make build
make push DOCKER_REGISTRY=my-dockerhub-username TAG=latest



## Trigger the Suspicious Event

### Find the Demo Pod Name
```bash
DEMO_POD=$(kubectl get pods -l app=demo-kubectl -o jsonpath="{.items[0].metadata.name}")


### Run kubectl exec from the Demo Container to Another Pod
```bash
kubectl exec -it $DEMO_POD -- kubectl exec -it <target-pod-name> -- ls

#### What Happens?
##### The first kubectl exec enters the "command-execution-using-kubectl" container.
##### From inside that container, another kubectl exec command runs, accessing a different pod.
##### This demonstrates container-to-container unauthorized acc
