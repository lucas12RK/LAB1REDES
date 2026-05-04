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
    |- fase1.py              # Fase I:  Identidad Criptográfica (KDF + RSA)
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

==========
## Ejecucion

Fase 1:
Genera las identidades criptográficas de los cuatro miembros del Consejo.
Crea dos pares de llaves RSA-2048 por miembro (cifrado y firma) y quedan en la carpeta claves/.
-Ingresa a la carpeta Laboratorio 1
-Ejecuta: python fase1.py
# Salida esperada:             
PS C:\Users\lucas\Desktop\a\uni\redes\Laboratorio 1\codigo> python fase1.py
========================================================================
FASE 1 — CONSTRUCCIÓN DE IDENTIDAD CRIPTOGRÁFICA DEL CONSEJO
========================================================================

[+] Miembro: Santiago Cifuentes (ROL 202373089-0)
    KDF      : PBKDF2-HMAC-SHA256 (iter=200000)
    SALT     : 2e20b79c01692cd34d551a34c9ba3864
    Seed h.  : 57f803825e1440243ca509aa6caeb8da…
    KEY1 fp  : a3ecb5c01f0ba37c  -> claves\202373089_0\key1_cifrado_priv.pem
    KEY2 fp  : 98b27684c5df04fc  -> claves\202373089_0\key2_firma_priv.pem

[+] Miembro: Lucas Roilar (ROL 202273058-7)
    KDF      : PBKDF2-HMAC-SHA256 (iter=200000)
    SALT     : b31f2a3a3a4b785e62fcf17ef90c6aaf
    Seed h.  : e28942ca0b9db991024ffb93e8246af0…
    KEY1 fp  : 3a81b9723ea846bd  -> claves\202273058_7\key1_cifrado_priv.pem
    KEY2 fp  : 96055e011cb16b34  -> claves\202273058_7\key2_firma_priv.pem

[+] Miembro: Maximiliano Sanchez (ROL 202273132-k)
    KDF      : PBKDF2-HMAC-SHA256 (iter=200000)
    SALT     : a168c6ad0523eef33e58017987d05ec7
    Seed h.  : c908411e0d66626330ad63881c05ea2c…
    KEY1 fp  : c9bc29170c1a4607  -> claves\202273132_K\key1_cifrado_priv.pem
    KEY2 fp  : 87dcc94306ec9bd5  -> claves\202273132_K\key2_firma_priv.pem

[+] Miembro: Felipe Rebellaut (ROL 202023024-2)
    KDF      : PBKDF2-HMAC-SHA256 (iter=200000)
    SALT     : 06932de6bc90208a9c6acb76802de9ca
    Seed h.  : 58b616d4cc070eb95154088a64f8af7d…
    KEY1 fp  : 632a0b8d5cc98990  -> claves\202023024_2\key1_cifrado_priv.pem
    KEY2 fp  : 6feb044663f25a2e  -> claves\202023024_2\key2_firma_priv.pem

========================================================================
Llaves persistidas bajo: C:\Users\lucas\Desktop\a\uni\redes\Laboratorio 1\codigo\claves
========================================================================

Las llaves generadas son deterministicas; correr fase1.py 2 veces con los mismos datos produce exactamente las mismas llaves.
Nota: Para pycryptomode, se recomienda usar la version exacta señalada en requirements.txt
