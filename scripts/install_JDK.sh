# This scripts installs JDK

#!/usr/bin/env bash

# Install dependencies if needed
which unzip curl 2>&1 || {
    echo "Installing dependencies..."
    apt-get update
    apt-get install -y unzip curl
}

# Install Java if needed
which java 2>&1 || {
    mkdir /usr/local/java
    echo "Fetching JDK..."
    pushd /usr/local/java
    curl -sL -o /var/tmp/jdk.tar.gz https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz
    tar xzvf /var/tmp/jdk.tar.gz
    rm /var/tmp/jdk.tar.gz

popd

    # Setup the location of java, javac
    update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk-12.0.1/bin/java" 1
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk-12.0.1/bin/javac" 1
}
