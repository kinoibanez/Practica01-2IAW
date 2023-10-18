# Practica01-2IAW

# COMENZAMOS CON LA NUEVA PRÁCTICA.

- Como primer paso deberemos darnos cuenta que la extensión para los archivos de instalación, o de cualquier tipo de update dentro del sistena es **_DNF_** por lo tanto tendremos que cambiar con respecto a Ubuntu.

- Lo primero que tendremos que hacer es un *dnf update* que realmente hace la función de upgrade y update al mismo tiempo.

- Descargamos git para poder usar los comandos relacionados con el.

## Instalar apache2.

- Como primer paso hacemos uso del comando *_sudo dnf install httpd -y_* para instalar el servicio de apache y despues tendremos que activar ese archivo para iniciarlo.

- Para iniciarlo hacemos uso del comando *_sudo systemctl start httpd_*.

- Para habilitar el servicio de arranque automaticamente ocn la máquina hacemos uso de *_sudo systemctl enabled httpd_*

- Y por ultimo para comprobar el estado hacemos uso de *_sudo systemctl status httpd_*

## El siguiente paso es la creación del script.

- El script lo creamos en una carpeta llamada script, el archivo se llamará install_lamp.sh, Es muy importante darle permisos con un chmod +x sobre el archivo para que asi pueda funcionar.

- Aqui podemos ver el funcionamiento del script.

![](/Practica01-2IAW/images/cap1.png)

## Cambiar permisos para el directorio.

- Tenemos que cambiar los permisos del propietario /var/www/html. El nuevo propietario tiene que ser apache:apache.

![](/Practica01-2IAW/images/cap2.png)
