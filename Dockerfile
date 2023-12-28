FROM node:19-alpine

WORKDIR /app

COPY ecommerce/package*.json ./

RUN npm ci

COPY ecommerce/ .

RUN npm run build

RUN npm install -g next

EXPOSE 4001

CMD ["next", "start", "-p", "4001"]