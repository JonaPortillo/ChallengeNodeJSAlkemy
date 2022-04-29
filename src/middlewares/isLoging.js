const db = require('../database/models');
let login = {
    isLogin: (req, res, next) => {
        if (req.session.usuario) {
            if (req.session.usuario.estaActivo == 1) {
                next();
            } else {
                res.json({
                    ok: false,
                    msg: "Su cuenta existe pero no está activa, activela en el email que llegó a su correo. O intente ingresar o registrarse ",
                    urls: {
                        login: `http://localhost:${process.env.PORT || "3001"}/auth/login`,
                        register: `http://localhost:${process.env.PORT || "3001"}/auth/register`
                    }
                })
            }

        } else {
            res.json({
                ok: false,
                msg: "No cuenta con la autorización para acceder a esta información, intente ingresar o registrarse.",
                urls: {
                    login: `http://localhost:${process.env.PORT || "3001"}/auth/login`,
                    register: `http://localhost:${process.env.PORT || "3001"}/auth/register`
                }
            })
        }
    },
    notLogin: (req, res, next) => {
        if (!req.session.user) {
            res.redirect('/')
        } else {
            next()
        }

    }

}

module.exports = login