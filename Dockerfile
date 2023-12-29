# Etapa de construcción
FROM node:19-alpine as builder

WORKDIR /app

COPY ecommerce/package*.json ./

RUN npm install
COPY ecommerce/ .
COPY ecommerce/public/ /ecommerce/public/

RUN npm run build
RUN npm run export

# Etapa de producción con NGINX
FROM nginx:alpine

# Copiar la versión estática generada a la ruta de contenido de NGINX
COPY --from=builder /app/out /usr/share/nginx/html
RUN apk add vim
ENV TZ=America/Santiago
COPY nginx.conf.template /etc/nginx/templates/
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/out /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]