# Configuración de n8n con Docker y PostgreSQL

## Descripción
Este proyecto configura n8n (una herramienta de automatización de flujos de trabajo) conectada a una base de datos PostgreSQL utilizando Docker Compose. El archivo `docker-compose.yml` define dos servicios: `n8n` y `postgres`.

## Servicios
- **n8n**: Ejecuta la aplicación n8n en el puerto 5678 con autenticación básica activada (usuario: `user`, contraseña: `password`).
- **postgres**: Base de datos PostgreSQL para almacenar los datos de n8n.

## Conexión utilizada
La conexión entre n8n y PostgreSQL se realiza a través de variables de entorno en el servicio de n8n:
- `DB_TYPE=postgresdb`
- `DB_POSTGRESDB_DATABASE=n8n`
- `DB_POSTGRESDB_HOST=postgres`
- `DB_POSTGRESDB_PORT=5432`
- `DB_POSTGRESDB_USER=n8n`
- `DB_POSTGRESDB_PASSWORD=n8n_password`

Esto permite que n8n se conecte automáticamente a la base de datos PostgreSQL en el contenedor `postgres` dentro de la red Docker.

## Cómo encender los servicios
Para iniciar los contenedores en segundo plano (modo detached), ejecuta el siguiente comando en la terminal desde el directorio donde se encuentra `docker-compose.yml`:

```
docker-compose up -d
```

Esto iniciará los contenedores de n8n y PostgreSQL. Una vez iniciado, n8n estará disponible en `http://localhost:5678`.

## Cómo apagar los servicios (sin eliminarlos)
Para detener los contenedores sin eliminarlos (para que queden guardados y puedas encenderlos nuevamente), ejecuta:

```
docker-compose stop
```

Esto detendrá los servicios pero mantendrá los contenedores y volúmenes intactos.

## Cómo encender los servicios nuevamente
Para iniciar los contenedores detenidos, ejecuta:

```
docker-compose start
```

Esto iniciará los contenedores previamente detenidos.

## Cómo apagar
Si deseas detener (por ejemplo, para liberar recursos), ejecuta:

```
docker-compose stop
```

Esto detendrá los servicios, eliminará los contenedores, pero mantendrá los volúmenes de datos (como la base de datos) para futuras ejecuciones.

## Acceso a n8n
- URL: `http://localhost:5678`
- Usuario: `user`
- Contraseña: `password`

## Notas adicionales
- Asegúrate de tener Docker y Docker Compose instalados en tu sistema.
- Los datos de PostgreSQL se persisten en un volumen llamado `postgres_data`.
- Los datos de n8n se almacenan en un volumen llamado `n8n_data` dentro del contenedor.
- Se corrigieron errores en el archivo `docker-compose.yml`: se eliminó la versión obsoleta y se cambió el volumen de n8n a un volumen nombrado para compatibilidad con Windows.
