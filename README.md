# Firebase RealTime Chat App

## 📌 Descripción

Esta es una aplicación de chat en tiempo real desarrollada en Flutter, utilizando Firebase como backend. La aplicación permite a los usuarios registrarse, iniciar sesión y comunicarse en tiempo real con otros usuarios.

Por el momento cuenta con un solo canal de chat, pero la idea es iterando con el tiempo.

## 🚀 Características

- Autenticación de usuarios con Firebase Authentication (Google Sign-In).
- Mensajería en tiempo real con Firestore.
- Diseño responsive y limpio.
- Gestión de estado con BLoC.

## .🛠️ Tecnologías Utilizadas

- **Flutter** (Dart)
- **Firebase Authentication** (Registro e inicio de sesión)
- **Cloud Firestore** (Base de datos en tiempo real)
- **BLoC** (Gestión de estado)
- **GetIt & Injectable** (Inyección de dependencias)
- **Freezed** (Generación de clases inmutables y manejo de estados)
- Lottie (Animaciones)

## 🏗️ Instalación y Configuración

### 1️⃣ Clonar el Repositorio

```sh
 git clone https://github.com/frandepy2/firebase-chat.git
 cd firebase-chat
```

### 2️⃣ Configurar Firebase

1. Crea un nuevo proyecto en Firebase.
2. Habilita Firebase Authentication (Email y/o Google Sign-In).
3. Descarga el archivo `google-services.json` (para Android) y `GoogleService-Info.plist` (para iOS) y colócalos en sus respectivas carpetas:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

### 3️⃣ Instalar Dependencias

```sh
flutter pub get
```

### 4️⃣ Ejecutar la Aplicación

```sh
flutter run
```

## 📂 Estructura del Proyecto

```sh
/lib
├───core
│   ├───common
│   ├───firebase
│   ├───helpers
│   ├───injectable
│   ├───routes
│   └───themes
└───features
    ├───auth
    │   ├───data
    │   │   ├───datasourses
    │   │   ├───models
    │   │   └───repository
    │   ├───domain
    │   │   ├───repository
    │   │   └───usecases
    │   └───presentation
    │       ├───bloc
    │       └───screens
    ├───chat
    │   ├───data
    │   ├───domain
    │   │   └───usecases
    │   └───presentation
    │       ├───bloc
    │       ├───screen
    │       └───widgets
    └───home
```

## 📝 Roadmap

- Agregar Push Notifications.
- Agregar salas de chat Multiples.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

Desarrollado con ❤️ por [Fran](https://github.com/tu-usuario)

