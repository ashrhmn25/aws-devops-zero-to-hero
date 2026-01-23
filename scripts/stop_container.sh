#!/bin/bash
set -e

# Delete any existing container with the name 'flask-app'
# Using '|| true' ensures the script doesn't fail if the container isn't found
echo "Cleanup: Stopping existing container..."
sudo docker rm -f flask-app || true