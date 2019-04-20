# This scripts installs Redis

#!/usr/bin/env bash

# Install dependencies if needed
which unzip curl 2>&1 || {
    echo "Installing dependencies..."
    apt-get update
    apt-get install -y unzip curl
}

# Install Redis if needed
which redis-server 2>&1 || {
    echo "Fetching Redis..."
    curl -sL -o /var/tmp/redis-stable.tar.gz http://download.redis.io/redis-stable.tar.gz
    tar xvzf /var/tmp/redis-stable.tar.gz
    rm /var/tmp/redis-stable.tar.gz

    # Install Redis and put on the path
    cd redis-stable
    make
    cp src/redis-server /usr/local/bin/
    cp src/redis-cli /usr/local/bin/

    # Set permission
    chmod +x /usr/local/bin/redis-server
    chmod +x /usr/local/bin/redis-cli
}
