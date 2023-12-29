# Etapa de construcción
FROM node:18-alpine as builder

WORKDIR /app

# Copiar archivos de paquete e instalar dependencias
COPY ecommerce/package*.json ./
RUN npm install

# Copiar el resto del código
COPY ecommerce/ .

# Construir la aplicación
RUN npm run build

# Etapa de producción
FROM node:18-alpine

WORKDIR /app
COPY --from=builder /app /app

EXPOSE 4001

# Iniciar la aplicación Next.js
CMD ["npm", "run", "start"]