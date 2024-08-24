# Use the latest Ubuntu image as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /cs2d_server

# Copy the script to download the CS2D server into the working directory
COPY download_cs2d_server.sh /cs2d_server

# Add support for 32-bit architecture (required for some 32-bit libraries)
RUN dpkg --add-architecture i386

# Update the package list to get the latest version information
RUN apt-get update -y

# Install required packages: curl for downloading, unzip for extracting,
# lib32z1 and libc6:i386 for 32-bit compatibility libraries
RUN apt-get install -y curl unzip lib32z1 libc6:i386

# Run the script to download and set up the CS2D server
RUN /bin/bash download_cs2d_server.sh

# Set the command to run when the container starts
ENTRYPOINT ["./cs2d_dedicated"]
