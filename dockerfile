# Use an official Node.js runtime as a base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application to the working directory
COPY . .

# Expose the port on which your Node.js application is running (Cloud Run expects it to be 8080)
EXPOSE 3000

# Define the command to run the application
CMD [ "npm", "run", "dev" ]

# Health check to improve Cloud Run's ability to determine the health of your application
HEALTHCHECK --interval=5s CMD curl -f http://localhost:8080/ || exit 1
