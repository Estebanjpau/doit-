---
# 🚀 Do It! - Aplicación de Lista de Tareas con Flutter

Una aplicación de lista de tareas moderna y robusta desarrollada en **Flutter**. Este proyecto demuestra una implementación de alta calidad utilizando **Clean Architecture**, gestión de estado con **Riverpod** y persistencia de datos local con **Drift**.

---

## ✨ Características

- ✅ **Gestión Completa de Tareas (CRUD):** Crea, lee, actualiza y elimina tareas fácilmente.
- 🔁 **Estado de Tareas:** Marca tareas como completadas o pendientes con un solo toque.
- 🔍 **Filtros Interactivos:** Filtra la vista de tareas para mostrar **"Todas"**, **"Por Hacer"** o **"Completadas"**.
- 💾 **Persistencia de Datos:** Las tareas se guardan localmente con SQLite mediante **Drift**, asegurando que no se pierdan.
- 📢 **Feedback al Usuario:** Notificaciones (Snackbars) confirman acciones como crear o eliminar tareas.
- ⚠️ **Diálogos de Confirmación:** Alertas para prevenir eliminaciones accidentales.

---

## 🏗️ Arquitectura y Principios

Este proyecto no es solo una To-Do app más. Es una **referencia de buenas prácticas** para construir apps Flutter escalables y mantenibles.

### ✅ Clean Architecture

Organizado en tres capas principales:

- **Presentación**
- **Dominio**
- **Datos**

Esto asegura bajo acoplamiento y alta cohesión.

### ✅ Principios SOLID - KISS - DRY
Parte fundamental de esta propuesta, es implementar principalmente los principios **SOLID**, para mantener el código **robusto, testeable y entendible** teniendo en cuenta los principios KISS(Keep It Simple Stupid) y DRY (Dont repeat yourself) 
que permiten un desarrollo legible y con objetivo.

### ✅ Gestión de Estado con Riverpod
El de **Riverpod** para gestión de estados es poderosísimo, ayuda a mantener los estados de forma **declarativa, reactiva y eficiente**. Utilizando injección de dependencias, permitiendo mantener modulos desacoplados y asegurandonos que los modulos
dependan de abstracciones y no de implementaciones como lo sugiere el principio de inversion de dependencias.

### ✅ Inmutabilidad
Estados de UI manejados con clases inmutables gracias a **Freezed**, lo que garantiza **predictibilidad**. Lo que también asegura un mejor manejo de recursos, generando asignaciones precisas de memoria, además de la gran ayuda en generación automatica
de funciones auxiliares para la conversión de datos con librerias auxiliares.

---

## 🌳 Estructura del Proyecto
El proyecto fue construido sobre la arquitectura de clean arquitecture:

![image](https://github.com/user-attachments/assets/2a059c13-112c-406d-a477-38a741da5f91)


Para la cual mantenemos esta implementacion

lib/\
### Modulo core
>En el se alojan las funcionalidades globales, no contiene lógica especifica ya que este modulo centraliza funciones que pueden ser utilizadas por otros modulo o features.
├── core/\
│   ├── data/\
│   │   └── database/*           # Configuración de la DB (Drift)\
│   ├── design_system/*          # Estilos de texto, colores, etc.\
│   ├── types/*                  # Enums y tipos globales\
│   └── utils/*                  # Funciones de utilidad y helpers\
│

## Feature-first architecture principle
> Normalmente yo organizo los modulos de las aplicaciones por paquetes con sus respectivos pubspec.yaml para mayor desacoplamiento y escalabilidad, pero para este proyecto me parecio más interesante manejar un principio de arquitectura orientada a features
> Que organiza el proyectos por funcionalidades especificas a desarrollar.

├── features/\
│   └── task/*                   - Módulo de Tareas

### Capa de infraestructura
>Capa de infraestructura, se encarga de la interaccion de las fuentes de datos de la aplicacion, para este caso solo se presentan funciones de almacenamiento local, pero también encontramos interacciones con apis externas y cualquier otro tipo de almacenamiento.

│       ├── data/\
│       │   ├── datasources/*    - Fuentes de datos (local)\
│       │   └── repository/*     - Implementación del repositorio

### Capa de dominio
>Capa que mantiene la logica de negocios y la capa central de la app, dónde se definen las reglas y logicas de negocio, orquestando las interacciones de la capa de datos sobre las entidades.

│       ├── domain/\
│       │   ├── entities/*       - Objetos de negocio puros\
│       │   ├── repositories/*   - Contratos (interfaces) de los repositorios\
│       │   └── usecases/*       - Casos de uso (lógica de negocio)

### Capa de presentacion
>Capa encargada de la gestion visual de la app, implemente MVVM como principio de arquitectura, para separar lógica de las vistas

│       └── presentation/\
│           ├── providers/*      - Providers de Riverpod\
│           ├── screens/*        - Pantallas de la UI\
│           ├── viewmodels/*     - ViewModels que gestionan el estado de la UI\
│           └── widgets/*        - Widgets reutilizables\
│\
## Modulo ui_base
>En este modulo desarrollamos la componetización de todos los Widgets que sean utilizados en todos los modulos o features generados, dónde alojariamos los buttons, textfields, select, checkboxes adaptados con diseños y lógica especifica. 

├── ui_base/*                    - \
│\
└── main.dart                   - Punto de entrada de la aplicación

---

## 🛠️ Dependencias
Lenguaje: Dart 3.8,1\
Framework: Flutter 3.32.2\
Gestión de Estado: flutter_riverpod y riverpod_generator\
Base de Datos Local: drift (implementación reactiva de SQLite)\
Modelos Inmutables: freezed\
Inyección de Dependencias: Riverpod\
Herramientas para generación de código: build_runner, freezed\
Funcionalidad SQL: sqlite3_flutter_libs

---

## 🚀 Cómo Empezar
Sigue estos pasos para ejecutar el proyecto en tu máquina local.

Prerrequisitos
Tener Flutter instalado (versión 3.8.1).

Un emulador de Android/iOS o un dispositivo físico.

Instalación
Clona el repositorio:

```
Bash

git clone https://github.com/tu_usuario/tu_repositorio.git
cd tu_repositorio
```

Instala las dependencias:

```
Bash

$ flutter pub get
$ Ejecuta el generador de código:
$ Este paso es crucial para generar los archivos necesarios para Riverpod, Freezed y Drift.
```
```
Bash

$ dart run build_runner build --delete-conflicting-outputs
```

Ejecuta la aplicación:
```
$ flutter run
```

### Consideraciones
La aplicación utiliza dependencias con actualizaciones recientes, por lo que para la ejecución de la misma desde plataformas como `Android Studio`, requiere la instalación la versión de nkd `"27.0.12077973"` en su sistema.

![image](https://github.com/user-attachments/assets/d1778d98-605b-41a3-b81e-8d3359f64fca)


---

## 📷Capturas de pantalla
![image](https://github.com/user-attachments/assets/201bdb69-aade-45cc-81da-406dae2799b7)
![image](https://github.com/user-attachments/assets/f5e722f3-d333-4ab4-bfbf-a47b692b4fdc)
![image](https://github.com/user-attachments/assets/d14493cc-053b-4b6b-b16b-e6ba21aa4bdf)


---

## 🤝 Contribuciones
Las contribuciones son bienvenidas. Si deseas mejorar este proyecto, por favor sigue estos pasos:

Haz un Fork del proyecto.

Crea una nueva rama (git checkout -b feature/AmazingFeature).

Realiza tus cambios y haz Commit (git commit -m 'Add some AmazingFeature').

Haz Push a la rama (git push origin feature/AmazingFeature).

Abre un Pull Request.
