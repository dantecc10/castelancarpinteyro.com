#!/bin/bash

# Verificar que se proporcionen todos los parámetros necesarios
if [ $# -ne 4 ]; then
    echo "Uso: $0 IP Usuario Contraseña BaseDeDatos"
    exit 1
fi

# Parámetros de conexión a la base de datos
IP=$1
Usuario=$2
Contraseña=$3
BaseDeDatos=$4

# Directorio donde se guardará el archivo de volcado (dump)
DirectorioDestino="/"

# Nombre del archivo de volcado (dump)
NombreArchivo="dump_${BaseDeDatos}_$(date +%Y-%m-%d_%H-%M-%S).sql"

# Comando para realizar el volcado (dump) de la base de datos
mysqldump --host="$IP" --user="$Usuario" --password="$Contraseña" "$BaseDeDatos" > "${DirectorioDestino}/${NombreArchivo}"

if [ $? -ne 0 ]; then
    echo "Error: No se pudo realizar el volcado de la base de datos."
    exit 1
else
    echo "Volcado de la base de datos completado con éxito."
fi

# Descargar el archivo de volcado (dump) a la máquina local
echo "Descargando el archivo de volcado..."
cp "${DirectorioDestino}/${NombreArchivo}" "/${NombreArchivo}"

echo "Descarga completada."
#!/bin/bash

# Verificar que se proporcionen todos los parámetros necesarios
if [ $# -ne 4 ]; then
    echo "Uso: $0 IP Usuario Contraseña BaseDeDatos"
    exit 1
fi

# Parámetros de conexión a la base de datos
IP="$1"
Usuario="$2"
Contraseña="$3"
BaseDeDatos="$4"

# Directorio donde se guardará el archivo de volcado (dump)
DirectorioDestino="/"

# Nombre del archivo de volcado (dump)
FechaHora=$(date +'%Y-%m-%d_%H-%M-%S')
NombreArchivo="dump_${BaseDeDatos}_${FechaHora}.sql"

# Comando para realizar el volcado (dump) de la base de datos
mysqldump --host="$IP" --user="$Usuario" --password="$Contraseña" "$BaseDeDatos" > "${DirectorioDestino}/${NombreArchivo}"

if [ $? -ne 0 ]; then
    echo "Error: No se pudo realizar el volcado de la base de datos."
    exit 1
else
    echo "Volcado de la base de datos completado con éxito."
fi

# Descargar el archivo de volcado (dump) a la máquina local
echo "Descargando el archivo de volcado..."
cp "${DirectorioDestino}/${NombreArchivo}" "/${NombreArchivo}"

echo "Descarga completada."

exit 0

exit 0
