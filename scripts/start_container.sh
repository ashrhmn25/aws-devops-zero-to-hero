#!/bin/bash
set -e

# 1. Fetch credentials and Repo URL from SSM
echo "Fetching parameters from AWS SSM..."
DOCKER_USERNAME=$(aws ssm get-parameter --name "/ashraf/dockerhub/username" --with-decryption --query "Parameter.Value" --output text)
DOCKER_PASSWORD=$(aws ssm get-parameter --name "/ashraf/dockerhub/password" --with-decryption --query "Parameter.Value" --output text)
REPO_URL=$(aws ssm get-parameter --name "/ashraf/dockerhub/repository" --with-decryption --query "Parameter.Value" --output text)

# 2. Login to Docker Hub
echo "Logging into Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# 3. Pull the latest image
echo "Pulling image: $DOCKER_USERNAME/$REPO_URL"
docker pull "$DOCKER_USERNAME/$REPO_URL:latest"

# 4. Run the container
echo "Starting new container..."
docker run -d -p 5000:5000 --name flask-app "$REPO_URL:latest"