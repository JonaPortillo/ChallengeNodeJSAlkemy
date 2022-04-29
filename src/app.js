const express = require('express');
const app = express();
const port = process.env.PORT || 3001;
const session = require('express-session');

const charactersRoute = require('./routes/characters');
const moviesRoute = require('./routes/movies');
const authRoute = require('./routes/auth');

// Convierte una petición recibida (POST-GET...) a objeto JSON
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Guarda la sesión del usuario al hacer login.
app.use(session({ secret: 'Mensaje secreto para API Disney' }));

// Rutas
app.use('/characters', charactersRoute);
app.use('/movies', moviesRoute);
app.use('/auth', authRoute);

// Error 404
app.use((req, res, next) => {
    res.status(404).json({
        ok: false,
        msg: "No encontramos la página que buscabas",
        url: `http://localhost:${port}/${req.url}`
    })
})

app.listen(port, function () {
    console.log(`Server running in http://localhost:${port}`);
});