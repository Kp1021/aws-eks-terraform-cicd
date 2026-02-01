FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package definitions and install production dependencies
COPY package*.json ./
RUN npm install --production

# Copy application source
COPY . .

# Expose application port
EXPOSE 3000

# Start the Node.js application
CMD ["node", "app.js"]