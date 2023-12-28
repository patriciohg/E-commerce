# Etapa de construcción
FROM node:latest as builder

WORKDIR /app

# Copiar archivos de paquete e instalar dependencias
COPY e-commerce/package*.json ./
RUN npm install

# Copiar el resto del código de la aplicación
COPY e-commerce/ .

# Construir la aplicación
RUN npm run build

# Etapa de producción
FROM node:latest

WORKDIR /app

# Copiar los archivos necesarios desde la etapa de construcción
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 4001

# Iniciar la aplicación Next.js
CMD ["npm", "run", "start"]
