Laboratorio 1 — Redes de Computadores 2026-1
Universidad Técnica Federico Santa María

Integrantes:
-Santiago Cifuentes
-Lucas Roilar 
-Maximiliano Sanchez
-Felipe Rebellaut

## Estructura del proyecto:

```text
codigo/
    |- fase1.py              
    |- fase2.py     
    |- fase3.py
    |- fase4.py
    |- claves/
        |- 202023024_2
            |- key1_cifrado_priv.pem
            |- key1_cifrado_pub.pem
            |- key2_firma_priv.pem
            |- key2_firma_pub.pem
        |- 202273058_7
        |- 202273132_K
        |- 202373089_0
|- requirements.txt
|- Makefile

|- README.md

## Requisitos:
-Python 3.8 o superior
-pip

## Instalacion de dependencias:
pip install -r requirements.txt
o usar make install   [esto instala las dependencias de requirements.txt]


## Ejecución

### Opción 1: ejecutar todas las fases en orden

```bash
make all
```

### Opción 2: ejecutar fase por fase

```bash
make fase1     
make fase2    
make fase3     
make fase4     
```
## Limpieza

Para volver al estado inicial (borrar todos los archivos generados):

```bash
make clean
```

Esto elimina las carpetas `claves/` y `comunicaciones/`, el archivo
`shares.txt`, y los `__pycache__/`.
