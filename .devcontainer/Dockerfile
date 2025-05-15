# Use base image with common dev tools
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install MySQL client and optional tools
RUN apt-get update && apt-get install -y \
    mysql-client \
    curl \
    && apt-get clean

