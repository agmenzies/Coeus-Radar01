FROM node:7.10.1 as source
WORKDIR /src/coeus-radar01
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.13.5
WORKDIR /opt/coeus-radar01
COPY --from=source /src/coeus-radar01/dist .
COPY default.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
