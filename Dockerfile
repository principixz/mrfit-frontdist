# Usa una imagen base de Nginx
FROM nginx:latest

# Elimina cualquier configuración previa de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia los archivos compilados de Angular desde la carpeta dist/frontrestaurante al directorio raíz de Nginx
COPY frontrestaurante /usr/share/nginx/html

# Copia el archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expone el puerto 80
EXPOSE 80

# Inicia Nginx
CMD ["nginx", "-g", "daemon off;"]