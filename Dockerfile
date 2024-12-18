# Use the Node.js 20 image as the base
FROM node:20

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files from the app directory
COPY app/package*.json /app/

# Clean the npm cache
RUN npm cache clean --force

# Install the latest version of npm
RUN npm install -g npm@latest

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY app /app

# Expose the port the app will run on
EXPOSE 3000

# Command to run the application
CMD ["node", "server.js"]
