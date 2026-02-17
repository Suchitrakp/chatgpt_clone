FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm config set fetch-retries 5 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set fetch-retry-maxtimeout 120000 \
 && npm config set network-timeout 600000 \
 && npm config set maxsockets 1 \
 && npm ci --legacy-peer-deps --no-audit --no-fund

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
