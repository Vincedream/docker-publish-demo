FROM node:8.16-slim

RUN apt-get update \
    && apt-get install -y nginx

WORKDIR /app

COPY package.json /app/package.json

RUN npm i --registry=https://registry.npm.taobao.org

COPY . /app


RUN npm run build \
    && cp -r build/* /var/www/html \
    && rm -rf /app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]