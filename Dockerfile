# Usar una imagen base de Node.js
FROM node:latest

# Crear el directorio de trabajo
WORKDIR /app

# Instalar Angular CLI globalmente dentro del contenedor
RUN npm install -g @angular/cli

# Copiar el archivo 'package.json' y 'package-lock.json' (si está disponible)
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm install

# Copiar los archivos del proyecto
COPY . .

# Exponer el puerto utilizado por la aplicación
EXPOSE 4200

# Comando para ejecutar la aplicación
CMD ["ng", "serve", "--host", "0.0.0.0", "--poll=1000"]
