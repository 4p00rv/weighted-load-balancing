FROM node:15.11-alpine
WORKDIR /usr/src/app
COPY ./package.json .
RUN npm install
COPY ./server.js .
CMD ["node", "server"]
