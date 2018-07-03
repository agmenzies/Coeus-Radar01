FROM node:7.10.1 as source
WORKDIR /src/Coeus-Radar01
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build
