# 🎓 Problema 1: Clasificación de Fatiga Muscular con DNN

## 📊 Estado del Proyecto

```
✓✓✓ COMPLETADO E INTEGRADO EN NOTEBOOK ✓✓✓

├── PUNTO 1: Análisis Preliminar ✅
│   ├── 1.a Preprocesamiento target (2 etiquetas: Normal/Desgaste)
│   └── 1.b Clasificación de características
├── PUNTO 2: Feature Engineering ✅
│   ├── 2.a Ventanas de 1 segundo (1000 muestras @ 1000Hz)
│   ├── 2.b Extracción: 7 características × 8 canales EMG = 56 features
│   └── 2.c Features: RMS, varianza, ZCR, mean_abs_slope, mean_freq, median_freq, spectral_power
├── PUNTO 3: EDA Completo ✅
│   ├── 3.1 Distribuciones y estadísticos descriptivos
│   ├── 3.2 Correlaciones (heatmap Pearson)
│   ├── 3.3 Separabilidad (boxplots + Cohen's d)
│   ├── 3.4 Balance de clases (70.9% Normal / 29.1% Desgaste)
│   └── 3.a Gráficos de señales en tiempo
├── PUNTO 4: Preprocesamiento ✅
│   ├── 4.1 Manejo de valores nulos
│   ├── 4.2 Separación X, y
│   ├── 4.3-4.4 Normalización sin leakage (dividir → escalar)
│   └── División estratificada 70% Train / 15% Val / 15% Test
├── PUNTO 5: Entrenamiento 5 Modelos ✅
│   ├── 5.1 kNN (k=5)
│   ├── 5.2 Decision Tree (max_depth=10)
│   ├── 5.3 Random Forest (100 árboles, max_depth=15)
│   ├── 5.4 Gradient Boosting (100 estimadores, depth=5)
│   ├── 5.5 DNN ⭐ (56→128→64→32→1, BatchNorm+Dropout+EarlyStopping)
│   ├── Tabla comparativa (Accuracy, Precision, Recall, F1, AUC)
│   ├── Gráficos comparativos
│   └── Curvas de aprendizaje + análisis overfitting
├── PUNTO 6: Evaluación Final ✅
│   ├── 6.a Selección del mejor modelo (por Test Accuracy)
│   ├── 6.b Reentrenamiento (train+val)
│   ├── 6.c Métricas finales (Accuracy, Precision, Recall, F1, AUC-ROC)
│   ├── Matriz de confusión (heatmap)
│   ├── Curva ROC y feature importance
│   └── 6.d-e Respuestas analíticas automáticas
└── PUNTO 7: Prueba Artificial ✅
    ├── 7.1 Generación de muestras sintéticas (Normal + Desgaste)
    ├── 7.2 Predicción en muestras artificiales
    └── 7.3 Análisis de coherencia del modelo
```

---

## 📁 Estructura del Proyecto

```
clasificacion/
├── 📘 clasificacion.ipynb               (52 KB)  ← PRINCIPAL
│   └── Notebook ejecutable Puntos 1-7 (49 celdas: 30 code + 19 markdown)
│
├── 📄 requirements.txt                 (272 B)  ← DEPENDENCIAS
│   └── Especificación de librerías necesarias
│
├── 🔧 install_dependencies.sh          (1.7 KB) ← SCRIPT INSTALACIÓN
│   └── Automatiza instalación de dependencias
│
└── 📖 README.md                        (ESTA GUÍA)
    └── Instrucciones y documentación
```

**Total**: 4 archivos, ~55 KB

---

## ✅ Dependencias Necesarias

### Librerías Requeridas

| Librería | Versión | Propósito |
|----------|---------|----------|
| **numpy** | ≥1.24.0 | Operaciones numéricas |
| **pandas** | ≥1.5.0 | Manipulación de datos |
| **matplotlib** | ≥3.7.0 | Visualización |
| **seaborn** | ≥0.12.0 | Gráficos estadísticos |
| **scikit-learn** | ≥1.3.0 | Modelos ML (kNN, Tree, RF, GB) |
| **datasets** | ≥2.14.0 | Descarga de datasets Hugging Face |
| **tensorflow** | ≥2.13.0 | DNN (Punto 5.5 - opcional) |

---

## 🚀 Instalación Rápida

### Paso 1: Instalar Dependencias

**Opción A: Script automático (RECOMENDADO)**

```bash
cd /home/jerf/EAFIT/IA/trabajos/parcial2/NN-Regression-and-Classification/clasificacion/

chmod +x install_dependencies.sh
./install_dependencies.sh
```

**Opción B: Manual**

```bash
pip install -r requirements.txt
```

**Opción C: Instalación individual**

```bash
pip install numpy pandas matplotlib seaborn scikit-learn datasets tensorflow
```

### Paso 2: Ejecutar el Notebook

**En Jupyter Notebook:**

```bash
cd /home/jerf/EAFIT/IA/trabajos/parcial2/NN-Regression-and-Classification/clasificacion/
jupyter notebook clasificacion.ipynb
```

**En VS Code:**
1. Abre el archivo `clasificacion.ipynb`
2. VS Code instalará automáticamente la extensión de Jupyter
3. Selecciona el intérprete de Python (si es necesario)
4. Ejecuta las celdas de arriba a abajo (o presiona "Run All")

---

## 📊 Resultados Esperados

### Ejecución Exitosa

El notebook ejecutará los siguientes pasos y mostrará:

```
PUNTO 1: Dataset de 3,002,137 registros → 3,002 ventanas
PUNTO 2: 56 características extraídas (7/canal × 8 canales)
PUNTO 3: EDA con gráficos (distribuciones, correlaciones, boxplots)
PUNTO 4: Datos divididos: 70% Train, 15% Val, 15% Test
PUNTO 5: 5 modelos entrenados:
  - kNN:              ~87% accuracy
  - Decision Tree:    ~82% accuracy
  - Random Forest:    ~89% accuracy ⭐ (mejor)
  - Gradient Boosting: ~87% accuracy
  - DNN:              ~85% accuracy

PUNTO 6: Evaluación Final (Random Forest)
  - Accuracy: 88.69%
  - Precision: 85.71%
  - Recall: 73.28%
  - F1-Score: 79.01%
  - ROC-AUC: 93.63% ✓ EXCELENTE

PUNTO 7: Validación con muestras artificiales
```

### Interpretación de Resultados

| Métrica | Interpretación |
|---------|---|
| **Accuracy 88.69%** | El modelo acierta en 88.69% de los casos totales |
| **Precision 85.71%** | De las predicciones positivas, 85.71% son correctas |
| **Recall 73.28%** | El modelo detecta 73.28% de los casos reales de desgaste |
| **F1-Score 79.01%** | Balance entre precisión y recall |
| **ROC-AUC 93.63%** | Excelente capacidad discriminativa entre clases |

---

## 💡 Notas Importantes

### Dataset
- **Fuente**: Muscle_Fatigue_Cycling (Hugging Face)
- **Tamaño**: 3M+ muestras de 8 canales EMG a 1000 Hz
- **Preprocesamiento**: Ventanas no solapadas de 1 segundo
- **Features**: 7 por canal (RMS, varianza, ZCR, pendiente, frecuencias, potencia espectral)

### Características Pedagógicas
- ✅ Código ejecutable sin funciones (`def`)
- ✅ Variables reutilizables entre secciones
- ✅ Comentarios indexados ([3.1], [3.2], etc.)
- ✅ Prints informativos con separadores visuales
- ✅ Visualizaciones completas con matplotlib/seaborn
- ✅ Sin dependencias externas de scripts

### Ejecución sin Errores Data Leakage

```python
# ✗ INCORRECTO:
scaler.fit(todos_datos)
X_train, X_test = split(datos_escalados)

# ✓ CORRECTO (implementado en el notebook):
X_train, X_test = split(datos)
scaler.fit(X_train)
X_train_scaled = scaler.transform(X_train)
X_test_scaled = scaler.transform(X_test)
```

---

## 🔧 Solución de Problemas

### Error: `ModuleNotFoundError: No module named 'datasets'`

**Causa**: Las dependencias no están instaladas

**Solución**:
```bash
pip install datasets
# O ejecuta:
pip install -r requirements.txt
```

### Error: `ModuleNotFoundError: No module named 'tensorflow'`

**Causa**: TensorFlow no está instalado (es opcional)

**Solución**: El notebook sigue funcionando con los otros 4 modelos. Para instalar TensorFlow:
```bash
pip install tensorflow
```

### El notebook se ejecuta lentamente

**Causa**: Descargando el dataset (3M+ muestras) por primera vez

**Solución**: Es normal. La ejecución completa tarda ~10-15 minutos la primera vez. Las próximas ejecuciones serán más rápidas porque el dataset se cachea.

### Los gráficos no se muestran

**En Jupyter**: Agregando esta celda al inicio:
```python
%matplotlib inline
```

**En VS Code**: Los gráficos se muestran automáticamente en las celdas.

---

## 📚 Recursos Adicionales

### En esta carpeta:
- `clasificacion.ipynb` - Notebook principal completo
- `requirements.txt` - Dependencias del proyecto
- `install_dependencies.sh` - Script de instalación
- `README.md` - Esta guía (documentación)

### En carpeta padre (`/NN-Regression-and-Classification/`):
- `GUIA_CLASIFICACION_COMPLETA.md` - Teoría detallada
- `PROBLEMA_2_GUIA.md` - Guía para Problema 2 (Regresión)

---

## 🎯 Conceptos Clave Enseñados

### 1. **Feature Engineering (Punto 2)**
- Extracción de características de señales EMG
- Ventanas deslizantes (sliding windows)
- Características de tiempo vs frecuencia

### 2. **EDA y Separabilidad (Punto 3)**
- Visualización de distribuciones
- Análisis de correlaciones
- Cohen's d para medir efecto de tamaño

### 3. **Preprocesamiento Sin Leakage (Punto 4)**
- División train/val/test primero
- Normalización solo con datos de train
- Importancia de la estratificación

### 4. **Comparación de Modelos (Punto 5)**
- kNN: Interpretable, simple
- Tree: Explainable, propenso a overfitting
- RF: Robusta, generalmente mejor
- GB: Muy potente pero lenta
- DNN: Flexible, captura no-linealidad

### 5. **Métricas Apropiadas (Punto 6)**
- Accuracy: Balance general
- Precision: Falsos positivos
- Recall: Falsos negativos
- F1: Balance P-R
- AUC: Robusto a desbalance

### 6. **Validación de Coherencia (Punto 7)**
- ¿El modelo tiene "sentido común"?
- Prueba con datos sintéticos
- Detecta overfitting

---

## 🚀 Mejoras Futuras

Si quieres ir más allá:

1. **GridSearchCV** - Optimización automática de hiperparámetros
2. **SMOTE** - Manejo de desbalance de clases
3. **Ensemble** - Combinación de múltiples modelos
4. **Feature Selection** - Seleccionar features más importantes
5. **Cross-Validation** - Validación cruzada k-fold

---

## 📞 Contacto / Soporte

**¿Listo para ejecutar? 🚀**

```bash
jupyter notebook clasificacion.ipynb
```

**Estado**: ✅ **100% Funcional y Documentado**

**Última actualización**: 2026-03-26
