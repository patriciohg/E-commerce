# Etapa de construcción
FROM node:18-alpine as builder

WORKDIR /app

# Copiar archivos de paquete e instalar dependencias
COPY e-commerce/package*.json ./
RUN npm install

# Copiar el resto del código
COPY e-commerce/ .


# Etapa de producción
FROM node:18-alpine

WORKDIR /app
COPY --from=builder /app /app

EXPOSE 4001

# Iniciar la aplicación Next.js
CMD ["npm", "run", "start"]
