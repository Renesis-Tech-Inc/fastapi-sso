# Makefile for Python project
# Variables
PROJECT_NAME=sso-auth
IMAGE_NAME=$(PROJECT_NAME):latest
CONTAINER_NAME=$(PROJECT_NAME)_container

# Command to format Python code using Black
format:
	@echo "Formatting Python code using Black..."
	black .

# Command to run the main Python script
run:
	@echo "Running the Python application..."
	python -B src/main.py

# Poetry commands
install:
	@echo "Installing dependencies using Poetry..."
	poetry install --no-root

# Docker commands
docker-build:
	@echo "Building the Docker image..."
	docker build -t $(IMAGE_NAME) .

docker-run:
	@echo "Running the Docker container..."
	docker run --name $(CONTAINER_NAME) -p 8000:8000 $(IMAGE_NAME)

docker-stop:
	@echo "Stopping the Docker container..."
	docker stop $(CONTAINER_NAME)

docker-remove:
	@echo "Removing the Docker container..."
	docker rm $(CONTAINER_NAME)

docker-clean:
	@echo "Removing the Docker image..."
	docker rmi $(IMAGE_NAME)

# Combined commands
docker-rebuild: docker-stop docker-remove docker-clean docker-build docker-run
	@echo "Rebuilding and running the Docker container..."

# Run locally with Poetry
run-local:
	@echo "Running the FastAPI application locally with Poetry..."
	python -B src/main.py


# Default command
.PHONY: install format docker-build docker-run docker-stop docker-remove docker-clean docker-rebuild run-local run