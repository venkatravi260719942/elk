FROM docker.elastic.co/beats/filebeat:7.17.25

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Switch to root user
USER root

# Install tzdata and other required packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add the Docker APT repository
RUN echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package database and install Docker
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Optionally, switch back to the original user if necessary
# USER filebeat

