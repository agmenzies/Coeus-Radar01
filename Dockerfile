FROM node:7.10.1 as source
WORKDIR /src/radar01
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.14.0

COPY content /usr/share/nginx/html
COPY conf /etc/nginx
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

WORKDIR /opt/radar01
COPY --from=source /src/radar01/dist .
COPY default.template /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
