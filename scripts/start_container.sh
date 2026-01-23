#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull ashraf1980/sample-python-flask-services

# Run the Docker image as a container
docker run -d -p 5000:5000 ashraf1980/sample-python-flask-services
