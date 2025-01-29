FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install essential system tools and development packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    openjdk-17-jdk \
    wget \
    curl \
    git \
    vim \
    iputils-ping \
    net-tools \
    sudo \
    ssh \
    less \
    nano \
    htop \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user with sudo privileges
RUN useradd -m -s /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Python packages
RUN pip3 install mrjob pandas numpy jupyter

# Set up Hadoop
ENV HADOOP_VERSION=3.3.6
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Download and install Hadoop
RUN wget https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && tar -xzf hadoop-${HADOOP_VERSION}.tar.gz \
    && mv hadoop-${HADOOP_VERSION} ${HADOOP_HOME} \
    && rm hadoop-${HADOOP_VERSION}.tar.gz

# Set ownership for the vscode user
RUN chown -R vscode:vscode /opt/hadoop

WORKDIR /workspace

# Don't switch to vscode user in Dockerfile
# Remove or comment out: USER vscode

# Add an entrypoint script
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]