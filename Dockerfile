FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm ci --legacy-peer-deps

COPY . .

# 🔥 THIS IS THE MISSING STEP
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
