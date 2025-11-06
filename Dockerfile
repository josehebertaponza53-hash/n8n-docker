# check=skip=SecretsUsedInArgOrEnv
# Imagen base oficial de n8n
FROM n8nio/n8n:latest

# Configuración de autenticación básica
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=user
ENV N8N_BASIC_AUTH_PASSWORD=password

# Configuración de base de datos
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=n8n
ENV DB_POSTGRESDB_HOST=postgres
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_USER=n8n
ENV DB_POSTGRESDB_PASSWORD=n8n_password

# Puerto que usa n8n
EXPOSE 5678

# Comando de inicio
CMD ["n8n", "start"]
