FROM node:7.10.1 as source
WORKDIR /src/Coeus-Radar01
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.13.5
WORKDIR /opt/Coeus-Radar01
COPY --from=source /src/Coeus-Radar01/dist .
COPY default.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
