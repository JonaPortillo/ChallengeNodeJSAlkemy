## API DISNEY

_Trabajo realizado para presentar a Alkemy como resolución al Challenge de de back-end con Node JS. API para manejo del Personajes y Peliculas/Series de Disney._

### Herramientas utilizadas.

- Node js.
- Sequelize (Manipulación de la DDBB).
- Nodemailer (Envíos de correos a la hora de registrarse).
- Express-session.
- JsonWebToken (Creación de Token de autenticación).
- Bcryptjs (Encriptación de contraseñas).
- Express-Validator (Validación de formularios).
- PostMan (Creación de documentación).

### Pasos a seguir:

1. Para empezar, debemos cargar la base de datos (Archivo "DDBB.sql"). Ejecutelo en su arministrador de Bases de Datos, puede ser DBeaver, Workbench, etc. Esto deberá proporcionarle la estructura y cargar los datos necesarios (Personajes, Películas, Generos y sus relaciones).

2. Como en todo proyecto de Node, ejecute "npm install" en su consola.

3. Ejecute "npm start", y suponiendo que todo va bien, debería levantarse el proyecto en el puerto 3001.

4. Para poder comenzar a consultar en la BBDD, primero deberá autenticarse; desde Postman (O su herramienta de peticiones HTTP) vaya a la ruta "http://localhost:3001/auth/register", en el body de su petición POST, deberá ingresar su Email y Contraseña, de esta forma:

```
{
    "email":"usuario@ejemplo.com",
    "pass":"contraseña"
}
```

5. Asegúrese de que sea un email válido, porque al registrarse, recibirá un correo con un link, para activar su cuenta. Revise su casilla e ingrese a ese link.

6. Eso automaticamente lo redirigirá a su navegador, y ya contará con la autenticación necesaria para poder hacer sus consultas.

7. Si por alguna razón no puede registrarse o activar su cuenta. Puede iniciar sesión con el correo y la contraseña del ejemplo del punto 4 (Al cargarla bbdd, ese uduario vino registrado y activado por defecto), vaya a la ruta "http://localhost:3001/auth/login", y el el body de su petición POST ingrese esos datos.

8. Ahora puede realizar sus peticiones sin más problemas.

**_Investigue qué peticiones puede hacer revisando la [Documentacion](https://documenter.getpostman.com/view/20730648/UyrGAtRd "Documentación API Disney") creada en PostMan_**
