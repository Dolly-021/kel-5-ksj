#!/bin/bash

sudo apt update
sudo apt upgrade -y

curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker $USER

docker compose up -d
