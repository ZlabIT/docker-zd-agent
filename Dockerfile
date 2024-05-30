# Use the official Jenkins agent image as the base image
FROM jenkins/agent:alpine-jdk17

# Switch to root user to install dependencies
USER root

# Update packages
RUN apk update

# Install Docker CLI
RUN apk add --no-cache docker-cli

# Install Python3 and pip
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache python3 pipx

# Install OpenSSH client
RUN apk add --no-cache openssh

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

# Create a writable temp directory
RUN mkdir -p /home/jenkins/tmp && chmod 777 /home/jenkins/tmp

# Switch back to jenkins user
USER jenkins

# Set TMPDIR to the writable temp directory
ENV TMPDIR=/home/jenkins/tmp

# Default command to keep the container running
CMD ["/bin/sh"]
