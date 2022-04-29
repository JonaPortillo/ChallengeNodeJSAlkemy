const jwt = require('jsonwebtoken')
require('dotenv').config()

function validateToken(req, res, next) {
    const accessToken = req.query.token
    if (!accessToken) {
        res.json({
            ok: false,
            msg: "Token de acceso expirado o incorrecto, intente ingresar o registrarseeeee.",
            urls: {
                login: `http://localhost:${process.env.PORT ? process.env.PORT : "3001"}/auth/login`,
                register: `http://localhost:${process.env.PORT ? process.env.PORT : "3001"}/auth/register`
            }
        })
    }

    jwt.verify(accessToken, process.env.SECRET, (err, user) => {
        if (err) {
            console.log(err);
            res.json({
                ok: false,
                msg: "Token de acceso expirado o incorrecto, intente ingresar o registrarse.",
                urls: {
                    login: `http://localhost:${process.env.PORT ? process.env.PORT : "3001"}/auth/login`,
                    register: `http://localhost:${process.env.PORT ? process.env.PORT : "3001"}/auth/register`
                }
            })
        } else {
            next()
        }

    })
}

module.exports = validateToken