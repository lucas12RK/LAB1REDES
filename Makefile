# ============================================================================
# Makefile — Laboratorio 1: Criptografia Aplicada

# Deteccion automatica del sistema operativo:
#   - Windows: usa "python"
#   - Linux/macOS: usa "python3"
# Se puede sobreescribir desde la linea de comandos:
#   make PYTHON=python3.11 install
ifeq ($(OS),Windows_NT)
    PYTHON ?= python
else
    PYTHON ?= python3
endif

SRC_DIR = codigo

# ---------- Targets principales ----------

.PHONY: all fase1 fase2 fase3 fase4 clean install help

help:
	@echo "Targets disponibles:"
	@echo "  make install   - Instala dependencias (requirements.txt)"
	@echo "  make all       - Ejecuta las 4 fases en orden"
	@echo "  make fase1     - Genera identidades del Consejo"
	@echo "  make fase2     - Cifrado hibrido y analisis ECB vs CBC"
	@echo "  make fase3     - Firma digital y simulacion de intercambios"
	@echo "  make fase4     - Comparticion de secretos (Shamir)"
	@echo "  make clean     - Borra archivos generados"
	@echo ""
	@echo "Interprete Python detectado: $(PYTHON)"

all: fase1 fase2 fase3 fase4
	@echo ""
	@echo "====== Todas las fases ejecutadas correctamente ======"

install:
	$(PYTHON) -m pip install -r requirements.txt

# ---------- Fases individuales ----------

fase1:
	@echo "====== Ejecutando Fase 1 - Identidad Criptografica ======"
	cd $(SRC_DIR) && $(PYTHON) fase1.py

# fase2 y fase3 dependen de fase1. Para evitar regenerar las llaves cada
# vez (PBKDF2 con 200k iteraciones es costoso), dependemos del directorio
# `claves` en lugar del phony `fase1`. Si las llaves ya existen, fase1 no
# se vuelve a correr.
fase2: $(SRC_DIR)/claves
	@echo "====== Ejecutando Fase 2 - Cifrado Hibrido y Analisis Visual ======"
	cd $(SRC_DIR) && $(PYTHON) fase2.py

fase3: $(SRC_DIR)/claves
	@echo "====== Ejecutando Fase 3 - La Misiva del Traidor ======"
	cd $(SRC_DIR) && $(PYTHON) fase3.py

fase4:
	@echo "====== Ejecutando Fase 4 - Secreto Compartido de Shamir ======"
	cd $(SRC_DIR) && $(PYTHON) fase4.py

# Regla implicita: si la carpeta `claves` no existe, ejecuta fase1.
$(SRC_DIR)/claves:
	cd $(SRC_DIR) && $(PYTHON) fase1.py

# ---------- Limpieza ----------

# Usamos Python para que sea portable entre Linux, macOS y Windows.
clean:
	@echo "====== Limpiando archivos generados ======"
	@$(PYTHON) -c "import shutil, os; \
[shutil.rmtree(p, ignore_errors=True) for p in [\
'$(SRC_DIR)/claves', '$(SRC_DIR)/comunicaciones', '$(SRC_DIR)/__pycache__']]; \
[os.remove(f) for f in ['$(SRC_DIR)/shares.txt'] if os.path.exists(f)]; \
print('Listo.')"