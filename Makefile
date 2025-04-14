# Define variables
IMAGE_NAME := heroes-tour
CONTAINER_NAME := heroes-tour
PORT := 3000

# Build Docker image (considering Dockerfile is inside 'app' directory)
build:
	docker build -t $(IMAGE_NAME) .

# Run Docker container in detached mode
run:
	docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop Docker container
stop:
	docker stop $(CONTAINER_NAME)

# Remove Docker container
remove:
	docker rm $(CONTAINER_NAME)

# Remove Docker image
remove-image:
	docker rmi $(IMAGE_NAME)

# View running containers
ps:
	docker ps

# View all containers (including stopped ones)
ps-all:
	docker ps -a

# View Docker images
images:
	docker images

# Execute a command inside the running container (e.g., bash shell)
exec:
	docker exec -it $(CONTAINER_NAME) bash

# Kubernetes KinD cluster variables
CLUSTER_CONFIG := cluster/kind-cluster-config.yaml
CLUSTER_NAME := k8s-cluster

# Create Kubernetes KinD cluster
create-cluster:
	kind create cluster --name $(CLUSTER_NAME) --config $(CLUSTER_CONFIG)

# Delete the Kubernetes cluster
delete-cluster:
	kind delete cluster --name $(CLUSTER_NAME)

# Get Kubernetes cluster info
cluster-info:
	kubectl cluster-info --context kind-$(CLUSTER_NAME)


# List KinD clusters
list-clusters:
	kind get clusters

# Make service accessible
port-forward:
	kubectl port-forward service/heroes-service 3000:80

# Clean up all containers and images
clean:
	docker stop $(shell docker ps -aq) || true
	docker rm $(shell docker ps -aq) || true
	docker rmi $(shell docker images -aq) || true

# Help target to display available commands
help:
	@echo "Available commands:"
	@echo "  make build               - Build Docker image (from ./app)"
	@echo "  make run                 - Run Docker container in detached mode"
	@echo "  make stop                - Stop Docker container"
	@echo "  make remove              - Remove Docker container"
	@echo "  make remove-image        - Remove Docker image"
	@echo "  make ps                  - View running containers"
	@echo "  make ps-all              - View all containers (including stopped ones)"
	@echo "  make images              - View Docker images"
	@echo "  make exec                - Execute a command inside the running container"
	@echo "  make clean               - Clean up all containers and images"
	@echo "  make create-cluster      - Create KinD cluster using 'cluster/kind-cluster-config.yaml'"
	@echo "  make delete-cluster      - Delete the KinD cluster"
	@echo "  make cluster-info        - Get cluster info"
	@echo "  make list-clusters       - List existing KinD clusters"
	@echo "  make port-forward        - Forward service port 3000:3000"

# Set default target
.DEFAULT_GOAL := build
