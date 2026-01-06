.PHONY: build up down logs shell clean help

# Default target
help:
	@echo "Available commands:"
	@echo "  make build    - Build Docker image"
	@echo "  make up       - Start Jupyter Lab (detached)"
	@echo "  make down     - Stop containers"
	@echo "  make logs     - View container logs"
	@echo "  make shell    - Open shell in container"
	@echo "  make clean    - Remove containers and images"
	@echo "  make dev      - Start with live output"

# Build the Docker image
build:
	docker-compose build

# Start Jupyter Lab in background
up:
	docker-compose up -d
	@echo "Jupyter Lab is running at http://localhost:8888"

# Start with live output (for development)
dev:
	docker-compose up

# Stop containers
down:
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# Open shell inside container
shell:
	docker-compose exec jupyter bash

# Clean up everything
clean:
	docker-compose down --rmi all --volumes --remove-orphans
	@echo "Cleaned up all containers and images"
