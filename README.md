# Scanbox

[![GoDoc](https://godoc.org/github.com/moby/buildkit?status.svg)](https://godoc.org/github.com/moby/buildkit/client/llb)
[![Build Status](https://github.com/moby/buildkit/workflows/build/badge.svg)](https://github.com/moby/buildkit/actions?query=workflow%3Abuild)
[![Go Report Card](https://goreportcard.com/badge/github.com/moby/buildkit)](https://goreportcard.com/report/github.com/moby/buildkit)
[![codecov](https://codecov.io/gh/moby/buildkit/branch/master/graph/badge.svg)](https://codecov.io/gh/moby/buildkit)

Quieres automatizar la tarea de reconocimiento en una auditoría web? Pues con esta herramienta 
lo puedes lograr en un menor tiempo de espera que si lo hicieras manualmente.

![Un plan de marketing es un documento o plano que contiene las (1)](https://user-images.githubusercontent.com/69093629/105557857-83ac5780-5d0d-11eb-9954-f3aa1e285eb9.png)

- **INTERFAZ: Grafica**
- **IMPORTANTE: Herramienta creada con fines educativos y eticos, no me hago responsable del 
mal uso que se le de ⚠️**
- **HERRAMIENTA: Automatizada**

## Pre-requisitos 📋

* [Exploit-db](https://www.exploit-db.com/) 
* [Nmap](https://nmap.org/) 


**Instalar Exploit-db**
```
sudo apt -y install exploitdb
```
**Instalar Nmap**
```
sudo apt install nmap 
``` 
## Instalacion ✔️
```
git clone https://github.com/WackyHacker/scanbox
```
```
cd scanbox
```
```
chmod +x scanbox.sh
```
```
./scanbox.sh
```
## Construido con 🛠️

* [Nmap](https://nmap.org/) - Escaner de puertos, servicios etc...
* [Exploit-db](https://www.exploit-db.com/) - Busqueda de exploits 

## Autor ✒️

**WackyHacker** - *Todo el proyecto* - [WEIK](https://github.com/WackyHacker)

## Licencia 📄

Este proyecto esta bajo Licencia - mira el archivo [LICENSE](https://github.com/WackyHacker/scanbox/blob/master/LICENSE) para mas detalles

## ¿Como funciona?

La herramienta es bastante sencilla de utilizar, lo único que se debe hacer es asignar la IP a la cual queremos hacer un escaneo completo con "Nmap", y tras hacerte el escaneo buscará las vulnerabilidades que podrían ser críticas contra la máquina, veamosla en funcionamiento...

Al iniciarla se veria algo asi: 

![Captura de pantalla (50)](https://user-images.githubusercontent.com/69093629/105560169-637f9700-5d13-11eb-9193-439508c033f8.png)
 
Se debe iniciar siendo usuario ROOT...

![Captura de pantalla (52)](https://user-images.githubusercontent.com/69093629/105560278-a0e42480-5d13-11eb-9b35-d2113ffdf25d.png)

Ahora si, como vemos nos salta un panel de ayuda, ya que no se ha ejecutado como debe con todos los parámetros correspondientes, para ejecutarla correctamente hay que asignar todos los datos que nos pide la herramienta. Empecemos explicando para qué sirve cada parámetro. El primer parámetro ``` -t ``` sirve para asignar la IP de la máquina, por ejemplo ``` 10.10.10.209``` , la ``` -s ``` sirve para asignar el escaneo, en este caso Nmap, y el último parámetro ``` -e ``` que se utiliza para hacer una búsqueda completa de exploits que podrían servir para hacer un ataque a la máquina, ahora asignemos estos parámetros y veamos su funcionamiento...

Quedaria algo asi la sintaxis:

![Captura de pantalla (54)](https://user-images.githubusercontent.com/69093629/105560739-02f15980-5d15-11eb-82d2-028507734387.png)

Una vez ejecutada...

![somos](https://user-images.githubusercontent.com/69093629/105561474-17365600-5d17-11eb-8da3-61600cb3cafc.gif)

 Como veis lo primero que hace es ver si todas las dependencias estan instaladas correctamente, una vez este todo bien lo que hace es empezar a hacer el escaneo con "Nmap" y finalmente te reporta por consola un output de todas las vulnerabilidades que ha encontrado contra la maquina, y aparte de eso te guarda las vulnerabilidades y el escaneo en un fitxero .txt alojados en la carpeta HTB/.

Dejame una ★ si te ha servido !!! 
