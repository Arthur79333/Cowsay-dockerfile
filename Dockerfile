# Use the official Node.js image as the base image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY /src entry-point.sh .

# Make the entry-point.sh executable
COPY entry-point.sh ./
RUN chmod +x entry-point.sh

# Install the dependencies
WORKDIR /app/src
RUN npm install

# Expose port 8080 (default port for the Cowsay server)
EXPOSE 3001

# Run the entry-point.sh script when the container starts
CMD ["sh", "-c", "/app/entry-point.sh 3001"]

