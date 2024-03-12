# Instrucciones de configuración del proyecto

## Autores

- Frank Sevilla
- Richard Guach
- Gerardo Quinaluisa

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes programas:

- **Laragon**: Descarga e instala Laragon desde [su sitio web oficial](https://laragon.org/).
- **PHP 8**: Laragon debería incluir PHP 8 por defecto. Verifica y cambia la versión de PHP si es necesario.
- **MySQL**: Incluido en Laragon.
- **Composer**: Descarga e instala Composer desde [su sitio web oficial](https://getcomposer.org/).

## Configuración del proyecto

1. **Clonar el repositorio**: Clona el repositorio de tu proyecto en la carpeta `www` de Laragon.

    ```bash
    cd C:\laragon\www
    git clone https://github.com/GhostarSS/Ropandina_PAIT_Quinto
    cd nombre-del-proyecto
    ```

2. **Instalar dependencias con Composer**:

    Ejecuta el siguiente comando para instalar las dependencias del proyecto:

    ```bash
    composer install
    ```

    Si encuentras algún error durante la instalación, intenta actualizar las dependencias con:

    ```bash
    composer update
    ```
