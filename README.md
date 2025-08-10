# 📋 Sistema de Gestión de Expedientes

Sistema de gestión de expedientes desarrollado en Microsoft Access y VBA, actualmente en proceso de refactorización hacia una arquitectura de capas moderna aplicando principios SOLID.

## 🎯 Descripción del Proyecto

Este proyecto gestiona expedientes de contratación pública, proporcionando funcionalidades para:
- Gestión completa de expedientes
- Control de estados y fechas
- Gestión de entidades relacionadas (comerciales, CPVs, ejércitos, etc.)
- Sistema de permisos y usuarios
- Integración con sistemas externos (AGEDYS, HPS)

## 🏗️ Arquitectura Actual

### Estado Legacy
- **Aplicación Principal:** `legacy/Expedientes.accdb`
- **Tecnología:** Microsoft Access con VBA
- **Patrón:** Código monolítico con lógica mezclada

### Estado Objetivo (En Desarrollo)
- **Arquitectura de Capas:** Separación clara entre presentación, lógica de negocio y acceso a datos
- **Principios SOLID:** Aplicación rigurosa de todos los principios
- **Patrones de Diseño:** Repository, Service Layer, Presenter
- **Testeable:** Código diseñado para pruebas unitarias

## 📁 Estructura del Proyecto

```
├── legacy/                    # Aplicación original
│   └── Expedientes.accdb     # Base de datos principal
├── src/                      # Código fuente refactorizado
│   ├── *.cls                # Clases de modelo y operaciones
│   ├── *.bas                # Módulos de funciones y variables
│   └── Form_*.doc.txt       # Documentación de formularios
└── tools/                   # Herramientas de desarrollo
    ├── SyncTool.accdb       # Herramienta de sincronización
    ├── exportar.bat         # Script de exportación
    ├── import.bat           # Script de importación
    └── *.vbs               # Scripts de automatización
```

## 🔧 Herramientas de Desarrollo

### Sistema de Sincronización
Para facilitar el desarrollo colaborativo, el proyecto incluye herramientas que permiten:
- **Exportar código VBA** desde Access a archivos de texto
- **Importar código** desde archivos de texto a Access
- **Control de versiones** del código VBA

#### Uso:
```bash
# Exportar código desde Access
tools\exportar.bat

# Importar código a Access
tools\import.bat
```

## 🚀 Principios de Refactorización

### Principios SOLID Aplicados
1. **Single Responsibility:** Cada clase tiene una única responsabilidad
2. **Open/Closed:** Abierto para extensión, cerrado para modificación
3. **Liskov Substitution:** Objetos intercambiables sin afectar funcionalidad
4. **Interface Segregation:** Interfaces específicas por cliente
5. **Dependency Inversion:** Dependencias hacia abstracciones

### Patrones de Diseño
- **Repository Pattern:** Abstracción del acceso a datos
- **Service Layer:** Encapsulación de lógica de negocio
- **Presenter Pattern:** Desacoplamiento de la UI
- **Facade Pattern:** Simplificación de interfaces complejas

## 📊 Entidades Principales

- **Expediente:** Entidad central del sistema
- **Usuario:** Gestión de usuarios y permisos
- **Comercial:** Empresas comerciales
- **CPV:** Códigos de clasificación
- **Ejercito:** Entidades militares
- **PECAL:** Códigos PECAL
- **RAC:** Códigos RAC
- **Suministrador:** Proveedores

## 🔒 Configuración

El archivo `tools/.env` contiene la configuración del entorno:
```
RUTA_CARPETA_APP="legacy"
NOMBRE_ACCDB_APP="Expedientes.accdb"
RUTA_CARPETA_SRC="src"
```

## 🤝 Contribución

Este proyecto sigue un modelo de **Code Review** riguroso:
1. Todo código debe seguir los principios SOLID
2. Separación clara de responsabilidades
3. Código testeable y mantenible
4. Documentación clara y concisa

## 📝 Estado del Proyecto

- ✅ **Estructura base:** Clases de modelo definidas
- ✅ **Constructor centralizado:** Acceso a datos unificado
- 🔄 **En desarrollo:** Refactorización hacia capas
- ⏳ **Pendiente:** Implementación de tests unitarios
- ⏳ **Pendiente:** Separación completa de responsabilidades

## 🛠️ Tecnologías

- **Microsoft Access** (Base de datos y UI)
- **VBA** (Lógica de aplicación)
- **VBScript** (Automatización)
- **Git** (Control de versiones)

---

*Este proyecto está en constante evolución hacia una arquitectura moderna y mantenible.*