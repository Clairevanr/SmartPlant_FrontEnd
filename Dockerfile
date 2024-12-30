FROM ubuntu:latest
LABEL authors="clair"

RUN npm install -g http-server
RUN apk update || : && apk add --update python3 make g++\   && rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE ${PORT}
CMD [ "http-server", "dist" ]