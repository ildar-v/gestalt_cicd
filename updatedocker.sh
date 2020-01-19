#!/bin/bash

set -e

echo "Starting git pull backend..."
cd ../gestalt_api/
git pull
echo "Backend repository successfully pulled."

echo "Starting git pull frontend..."
cd ../gestalt_front/
git pull
echo "Frontend repository successfully pulled."

cd ../cicd

echo "Stoping docker compose instance..."
docker-compose down
echo "Docker compose instance successfully stopped"

echo "Building docker compose image..."
docker-compose build
echo "Building docker compose image ended."

echo "Running compose..."
docker-compose up -d
echo "Docker compose instance successfully runned!"