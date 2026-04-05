# Base image: Node.js 22 LTS on Alpine Linux (~55 MB)
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency manifest first (layer caching)
COPY package*.json ./

# Install dependencies inside the image
RUN npm install

# Copy all application source files
COPY . .

# Document that the container listens on port 3000
EXPOSE 3000

# Environment variable baked into the image
ENV MODE=docker

# Command to run when the container starts
CMD ["node", "app.js"]