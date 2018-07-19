FROM node:7.10.1 as source
WORKDIR /src/coeus-radar01
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.14.0
WORKDIR /opt/build-your-own-radar
COPY --from=source /src/coeus-radar01/dist .
COPY default.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
