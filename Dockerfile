FROM node:16

WORKDIR /app

# Ensure you're copying the necessary files to the /app directory in the container
COPY package*.json /app/

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . /app

EXPOSE 3000

CMD ["npm", "start"]
