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
## Configuración de constantes

Para configurar las constantes del proyecto, sigue estos pasos:

1. **Ubicación del archivo**: Navega hasta la carpeta `config` dentro de tu proyecto.

    ```bash
    cd ruta/del/proyecto/config
    ```

2. **Editar el archivo `config.php`**: Abre el archivo `config.php` en tu editor de texto favorito.

    ```php
    <?php
    const BASE_URL = "http://localhost/Ropandina/";
    const HOST = "localhost";
    const USER = "root";
    const PASS = "";
    const DB = "shop";
    const CHARSET = "charset=utf8";
    const TITLE = "SHOP";
    const MONEDA = "USD";
    const CLIENT_ID = "";
    ?>
    ```

    - `BASE_URL`: La URL base de tu proyecto. Asegúrate de que coincida con la ruta de tu proyecto en el servidor local.
    - `HOST`: El host de tu base de datos. Generalmente es "localhost" para entornos de desarrollo.
    - `USER`: El nombre de usuario para acceder a tu base de datos. "root" es el predeterminado en entornos de desarrollo.
    - `PASS`: La contraseña para acceder a tu base de datos. Déjalo vacío si no tienes una configurada.
    - `DB`: El nombre de la base de datos que tu proyecto utilizará.
    - `CHARSET`: El conjunto de caracteres para la conexión con la base de datos. Generalmente es "utf8".
    - `TITLE`: El título de tu proyecto. Se utilizará en la etiqueta `<title>` de las páginas.
    - `MONEDA`: La moneda que utilizará tu tienda. Por ejemplo, "USD" para dólares estadounidenses.
    - `CLIENT_ID`: El ID del cliente para integraciones de terceros, si es necesario.

3. **Guardar cambios**: Después de editar el archivo `config.php` con tus propias configuraciones, guarda los cambios.