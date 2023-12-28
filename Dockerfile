# Etapa de construcción
FROM node:latest as builder

WORKDIR /app

# Copiar archivos de paquete e instalar dependencias
COPY e-commerce/package*.json ./
RUN npm install

# Copiar el resto del código
COPY e-commerce/ .

RUN npm run build

# Etapa de producción
FROM node:latest

WORKDIR /app
COPY --from=builder /app /app

EXPOSE 4001

# Iniciar la aplicación Next.js
CMD ["npm", "run", "start"]
