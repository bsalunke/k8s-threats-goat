# Start with Alpine for a lightweight image
FROM debian 

RUN id

# Install curl for fetching kubectl
RUN apt-get update 

RUN apt-get install curl -y 

# Download and install kubectl
ARG KUBECTL_VERSION=v1.23.0
RUN curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Ensure kubectl is available
RUN kubectl version --client

# Keep the container running indefinitely
CMD ["tail", "-f", "/dev/null"]
