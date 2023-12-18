#!/bin/bash 

#Configuramos el script para que se muestren los comandos que se ejecutan 

set -x

# Actualizamos los paquetes

dnf update -y


#Instalamos los servicios del Web Apache

dnf install httpd -y

#Iniciamos el servicio de apache

systemctl start httpd

#Configuramos para que el servicio se inicie automaticante.

systemctl enable httpd

#Instalamos MySql Server 

dnf install mysql-server -y

#Iniciamos el servicio de mysql.
sudo systemctl start mysqld -y

#Configuramos el servicio para que se inicia automaticamente en cada reinicio.

sudo systemctl enable mysqld -y

-------------------------------------------------------------------------------------
#Instalamos php

dnf install php -y

#Instalamos la extensión de PHP para MySql

dnf install php-mysqlnd -y

#Reiniciamos el servicio de apache

systemctl restart httpd

#Copiamos el archivo info.php en /var/www/html

cp ../php/info.php /var/www/html 

#Cambiamos el propiertario y el grupo del directorio /var/www/hmtl 

chown -R apache:apache /var/www/html