# kommandozeile-all

*Description:* Summary of command Line and helpful tools to improve efficiency and enablers to deploy and abstract even more. 

## Table of contents 

[Headers](#headers)  



## vim editor

vim Editor commands: 

1. move to beginning of the current line, 0
2. move to end of line, $
3. move to the top of the current window (high), H
4. move to the middle of the current window (middle), M
5. move to the bottom line of the current window (low), L
6. move to the first line of the file, 1G
7. move to the 20th line of the file, 20G
8. move to the last line of the file, G

9. the "* and "+ paste the clipboard into the insert mode 

10. undo: 
`u`
- or:
` :u `
- or: 
` :undo `
- or: 
` :undo 3 `


# From the course:

##

### utilidades batch:
- cat // mostrar contenido completo
- head // mostrar la cabeza del archivo, first 10 lines
- tail // last 10 lines
- $ tail -n 20 file.txt // last 20 lines 

### utilidades batch avanzadas:
- grep // permite trabajar con archivos regulares, busca lineas 
- $ grep -i "hanks'),$" dump1.sql // aca el $ quiere decir, el resto
- $ grep "^keyword" file.txt // todo lo que esta al inicio
- $ grep "keyword$" file.txt // todo lo que esta al final

### sed 
- sed // sed is stream editor, usa mucho expresiones regulares
- sed 's/Hanks/Selleck/g' dump1.sql // no modifica el archivo, solo crea un nuevo flujo
- $ sed '$d' nuevasPelis.csv // borra la ultima linea
- $ sed 's/USER_NAME/ana10/' file.txt
- $ sed 's/USER_NAME/ana10/; s/USER_POINTS/34' file.txt
- $ echo "the new car is the most incredible machine in a town" | sed 's/a town/the world/'
- $ sed -f myfileWithCommands myFile // to use a file with commands
- $ s/pattern/replacement/flags // the flags could be g, A, p, w
- si el flag es un numero, entonces ese es el numero de ocurrencia;
- g es global, todas las ocurrencias
- p imprime patron original, cada linea que tiene una coincidencia
- w, guarda en un file especifico
- more info at: https://likegeeks.com/es/sed-de-linux/

### awk 
- awk // sirve para trabajar con textos estructurados, como csv, o separados por tabs o similares
- $ awk -F ';' '{ print $1}' nuevasPelis.csv // esto imprime la primera columna
- $ awk -F ';' 'NR > 1 && $3 > 0 { print $1, $3 * $4 }' nuevasPelis.csv // imprime number row mayor que 1, y columna 3, $3 es mayor que 0, e imprime con esa condicion, la columna 1 ($1) y la columna 3 por la 4 ($ * $4) 

## procesamiento de datos

### Flujos estandar en la terminal:
- entrada estandar
- salida estandar
- error estandar

- Los flujos estan conectados a los perifericos

- redireccion: cambiar la entrada del teclado a un archivo:

```
$ mysql -h 127.0.0.1 -u root -p1234 < dump1.sql // usando el menor que
``` 

- Redireccionamiento de salida, de pantalla a un archivo:
``` 
$ ls > file_ls.txt // guarda la salida en un archivo 
```

- Con >> agrego el resultado al qarchivo que ya tenia;

- pipes: |; toma lasalida de un proceso y se lo pasa a otro
```
$ ls -l | more
$ ls -l | wc // wc es word count
$ ls -l | wc -l // muestra cuantas lineas
```

- Proceso en background:
se pone un ampersan al final
```
$ ls -l > asd &
$ php infitine_loop.php & // se manda al backgound
```

- Hay servicios que corren en el background, se llaman daemons 
- con Ctrl + z, se manda al background (segundo plano)
- con Ctrl + c, lo cancelo (se interrumpe)
- ps es para ver los pids y poder terminar servicios; ps es un proceso batch (or bash, idk)
```
$ ps ax
$ ps ax | grep init
```
- top
`$ top`

- Para matar procesos: 
```
$ kill -9 [pin number] // mata un proceso por pid
$ killall
```

### usuarios en linux o unix:

u - Owner of the file
g - Grupos
o - Otros
a - todos

### Operaciones:

- r - Leer, Read
- w - Escribir, Write
- x - ejecutar, Execute 

```
+ agregar
- quitar
```

### Permisos (textual es cuando uso caracteres):

- chmod (change mode): 
```
$ chmod o-w file.txt
```

chown (change owner):
chgrp (change group):

- Permisos Binarios (numeros en lugar de numeros):

- Hay 10 columnas:
- -rw-rw-r--. 1 ss ss  450 Nov 11 10:44 index.html

- La primera es el tipo de archivo, esos tipos son:

- archivo regular: -
- Directorio: d
- Archivo especial como dispositivo de bloque: b
- Archivo de caracter especial: c
- Enlace simbolico: l
- Tuberia nombreada (FIFO): p 
- Zocalo de cominio (socket): s

- El siguiente grupo de 3 caracteres es de: propietario del archivo
- Permisos del grupo
- los ultimos 3: Permisos del resto de usuarios del sistema

### Buscar archivos


- $ locate file.text // antes de usarlo, se debe updatear la base de datos:
- $ sudo updatedb // ahora si se puede usar el comando locate

- $ whereis echo // se usa para encontrar archivos binarios del sistema
` 
$ whereis python
`

### Find, busca en directorios siguiente una serie de criterios
- $ find . -user ss -perm 644 // busca en el directorio actual, que pertenecan a ss y que tengan permisos 644
- $ find . -user ss // busca desde el directorio actual (.) todos los archivos que pertenezcan al usuario ss
- $ find . -type f -mtime +7 // buscan solo files (f) modificados hace mas de 7 dias (+7)
- // con find, tambien se puede ejecutar comandos adicionales, en este caso, cp (copy), los curly brackets son para indicar donde debe ir el nombre del archivo encontrado;
- // Se debe cerrar el comando con \; ... tal cual, see example as follows: 
```$ 
find . -type f -mtime +7 -exec cp {} ./backup/ \; 
```

### Interaccion con paginas web/files en la web, desde la terminal; 
```
$ curl // devuelve el codigo directamente de la pagina
$ wget // descarga arvhivos desde un servidor web
$ curl https://platzi.com
$ curl -v https://platzi.com // incluye peticiones HTTP
$ curl -v https://platzi.com > /dev/null // bota la salida estandar a /dev/null osea no la muestra
$ wget pagina.com/file.pdf // guarda el file pdf en tu laptop
```


# Markdown Cheatsheet

1. [md cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)



# npm common commands:

1. 

