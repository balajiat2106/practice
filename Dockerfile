# Build stage
FROM node:alpine3.10 as build

COPY package.json /app/
COPY src /app/
WORKDIR /app/
RUN npm install

FROM node:alpine
COPY --from=build /app/ /app/
CMD [ "node","server.js" ]