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