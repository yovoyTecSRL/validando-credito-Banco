#!/bin/bash
# Script de preparación y ejecución para card_validation_app

set -e

echo "Clonando repositorio (si no está clonado)..."
if [ ! -d "card_validation_app" ]; then
    git clone https://github.com/yovoyTecSRL/validacion-credito.git card_validation_app
fi

cd card_validation_app

echo "Creando entorno virtual..."
python3 -m venv venv

echo "Activando entorno virtual..."
source venv/bin/activate

echo "Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo
echo "IMPORTANTE: Configura tus variables en el archivo .env antes de ejecutar."
if [ ! -f .env ]; then
    echo "Crea tu archivo .env con las variables necesarias (puedes copiar y editar .env.example si existe)"
    touch .env
    echo "# Agrega tus variables aquí, ejemplo:" >> .env
    echo "OPENAI_API_KEY=tu_clave_openai" >> .env
    echo "CCSS_API_URL=..." >> .env
    echo "...etc..." >> .env
fi

echo
echo "Ejecutando aplicación principal..."
python main.py
