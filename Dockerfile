# Dockerfile personalizado para n8n con FFmpeg
FROM n8nio/n8n:latest

# Cambiar a usuario root para instalar paquetes
USER root

# Actualizar packages e instalar FFmpeg
RUN apk update && \
    apk add --no-cache ffmpeg ffmpeg-dev && \
    rm -rf /var/cache/apk/*

# Verificar la instalación de FFmpeg
RUN ffmpeg -version

# Crear directorio para datos compartidos
RUN mkdir -p /data/shared && \
    chown -R node:node /data/shared

# Volver al usuario node por seguridad
USER node

# Exponer el puerto por defecto de n8n
EXPOSE 5678

# Comando por defecto
CMD ["n8n"]
