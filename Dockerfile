FROM node:22

WORKDIR /app

COPY package*.json ./

# Install dependencies including correct SWC binary
RUN npm install

# Force SWC binary installation
RUN npm install @next/swc-linux-x64-gnu

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
