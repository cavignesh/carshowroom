FROM node:16-alpine

# Upgrade npm
RUN npm install -g npm@8

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json, then install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port
EXPOSE 5000

# Define the command to run the application
CMD ["npm", "start"]
