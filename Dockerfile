FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json from the 'app' directory in the repository to the container's working directory
COPY app/package*.json /app/

# Clean npm cache and update npm
RUN npm cache clean --force
RUN npm install -g npm@latest

# Install dependencies
RUN npm install

# Copy the rest of your application code from the 'app' directory to the container's working directory
COPY app/ /app/

# Expose the port your application will run on
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]
