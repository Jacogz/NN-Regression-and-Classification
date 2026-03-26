#!/bin/bash
# Script de instalación de dependencias para clasificacion.ipynb

echo "╔════════════════════════════════════════════════════════╗"
echo "║   INSTALACIÓN DE DEPENDENCIAS - clasificacion.ipynb    ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Detectar si hay venv
if [ -d "../../venv" ]; then
    echo "✓ Ubicación venv detectada"
    source ../../venv/bin/activate
    PYTHON_CMD="python"
elif [ -d "../../../.venv" ]; then
    echo "✓ Ubicación .venv detectada"
    source ../../../.venv/bin/activate
    PYTHON_CMD="python"
else
    PYTHON_CMD="python3"
    echo "⚠️  No se detectó venv, usando: $PYTHON_CMD"
fi

echo ""
echo "Python executable: $($PYTHON_CMD --version)"
echo ""

# Instalar requirements.txt
echo "📦 Instalando dependencias desde requirements.txt..."
$PYTHON_CMD -m pip install --upgrade pip
$PYTHON_CMD -m pip install -r requirements.txt

echo ""
echo "✅ Instalación completada"
echo ""
echo "Verificando módulos..."
$PYTHON_CMD << 'EOF'
import sys
modules = ['datasets', 'numpy', 'pandas', 'matplotlib', 'seaborn', 'sklearn']
missing = []
for m in modules:
    try:
        __import__(m)
        print(f"  ✓ {m}")
    except ImportError:
        missing.append(m)
        print(f"  ✗ {m} (faltante)")

if missing:
    print(f"\n⚠️  Faltantes: {', '.join(missing)}")
else:
    print("\n✅ TODAS LAS DEPENDENCIAS INSTALADAS CORRECTAMENTE")
EOF
