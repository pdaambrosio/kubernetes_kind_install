# Kubernetes Kind Install

This repository provides a streamlined approach to set up a Kubernetes cluster using [Kind (Kubernetes IN Docker)](https://kind.sigs.k8s.io/). Kind is a tool for running local Kubernetes clusters using Docker container nodes, primarily designed for testing Kubernetes itself, but it can also be used for local development or CI.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/): Required to run containerized nodes.
- [Go](https://golang.org/doc/install): Necessary for building Kind from source.
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): Command-line tool for interacting with the Kubernetes cluster.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/pdaambrosio/kubernetes_kind_install.git
   cd kubernetes_kind_install
   ```

2. **Build and Install Kind:**

   The repository includes a script to build and install Kind:

   ```bash
   ./install_kind.sh
   ```

   This script will:

   - Clone the Kind repository.
   - Build the Kind binary.
   - Move the binary to `/usr/local/bin` for global access.

3. **Create a Kubernetes Cluster:**

   After installing Kind, you can create a cluster using the provided configuration:

   ```bash
   kind create cluster --config kind-config.yaml
   ```

   The `kind-config.yaml` file contains the cluster configuration, which you can customize as needed.

## Usage

Once the cluster is up and running, you can interact with it using `kubectl`. For example:

- **Check Cluster Nodes:**

  ```bash
  kubectl get nodes
  ```

- **Deploy Applications:**

  Apply your Kubernetes manifests to deploy applications:

  ```bash
  kubectl apply -f your-deployment.yaml
  ```

- **Access Cluster Information:**

  To get detailed information about the cluster components:

  ```bash
  kubectl cluster-info
  ```

## Cleanup

To delete the Kind cluster and free up resources:

```bash
kind delete cluster
```

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

