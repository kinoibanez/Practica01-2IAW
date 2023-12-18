#!/bin/bash

#Configuramos el script para que se muestren los comandos que se ejecutan 

set -ex

#Importamos el archivo de variables

source .env

# Actualizamos los paquetes

dnf update -y

# Instalamos los modúlos de PHP necesarios para PHPMyAdmin

dnf install php-mbstring php-zip php-json php-gd php-fpm php-xml -y

#Reiniciamos el servicio de Apache

systemctl restart httpd


#Instalamos la utilidad wget

dnf install wget -y

#Eliminamos descargas previas de PhpMyAdmin

rm -rf /tmp/phpMyAdmin-5.2.1-all-languages.zip

#Eliminamos instalaciones previas de PhPMyAdmin

rm -rf /var/www/html/phpmyadmin

#Descargamos el código fuente de phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip -P /tmp

#Instalamos la utilidad unzip 

dnf install unzip -y

# Descomprimimos el código fuente de la página PhPMyAdmin en /var/www/html

unzip -u /tmp/phpMyAdmin-5.2.1-all-languages.zip -d /var/www/html

#El menos f (-f) sobreescribe cuando descargamos otra vez el mismo directorio.

#El menos -u (-u) hace el update.

#Renombramos el directorio de PhPMyAdmin

mv /var/www/html/phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

# Actualizamos los permisos del directorio /var/www/html 

chown -R apache:apache /var/www/html

# Copiamos el archivo de configuración de ejemplo y lo convertimos en un archivo correcto. Creamos un archivo de configuracion a partir de un archivo de ejemplo.

cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php

# Generamos un valor aleatorio de 32 caracteres para la variable blowfish_secret
RANDOM_VALUE=`openssl rand -hex 16`

# Modificamos la variable blowfish_secret en el archivo de configuración
sed -i "s/\(\$cfg\['blowfish_secret'\] =\).*/\1 '$RANDOM_VALUE';/" /var/www/html/phpmyadmin/config.inc.php

#Eliminamos si existe alguna base de dato previa de PhPMyAdmin

mysql -u root <<< "DROP DATABASE IF EXISTS phpmyadmin"

# Importamos el script de creacion de base de datos de PhPMyAdmin

mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql

#Creamos el usuario para la base de datos y le asignamos privilegios.

mysql -u root <<< "DROP USER IF EXISTS $PMA_USER@'%'"
mysql -u root <<< "CREATE USER $PMA_USER@'%' IDENTIFIED BY '$PMA_PASS'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $PMA_DB.* TO $PMA_USER@'%'"
