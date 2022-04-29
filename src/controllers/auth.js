require('dotenv').config();
const db = require('../database/models');
const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const sendEmail = require('../nodemailer/registerEmail');


module.exports = {
    login: (req, res) => {
        let errors = validationResult(req);

        if (errors.isEmpty()) {
            db.Usuario.findOne({
                where: {
                    email: req.body.email
                }
            })
                .then(usuario => {
                    req.session.usuario = {
                        id: usuario.id,
                        email: usuario.email,
                        estaActivo: usuario.estaActivo
                    };
                    res.locals.user = req.session.user;
                    return res.json({
                        ok: true,
                        msg: "Sesion iniciada correctamente",
                        urls: {
                            character: `http://localhost:${process.env.PORT || "3001"}/characters`,
                            movies: `http://localhost:${process.env.PORT || "3001"}/movies`
                        },
                        data: usuario
                    })
                })
                .catch(e => console.log(e))
        } else {
            return res.json({
                ok: false,
                errors: errors.mapped()
            })
        }
    },
    register: (req, res) => {
        let errors = validationResult(req);
        if (errors.isEmpty()) {
            let { email, pass } = req.body;
            db.Usuario.create({
                email: email,
                pass: bcrypt.hashSync(pass, 10),
            })
                .then((usuario) => {
                    function generateAccessToken(usuario) {
                        return jwt.sign(usuario, process.env.SECRET, { expiresIn: '10000h' })
                    }
                    const accessToken = generateAccessToken({
                        id: usuario.id,
                        email: usuario.email,
                        estaActivo: 0
                    })
                    sendEmail(email, `http://localhost:${process.env.PORT || "3001"}`, accessToken);
                    return res.json({
                        ok: true,
                        msg: "Usuario registrado correctamente, no olvide revisar su email para para actuvar la cuenta",
                        email: usuario.email,
                        urlToLogin: `http://localhost:${process.env.PORT || "3001"}/auth/login`
                    })
                })
                .catch(e => console.log(e))
        } else {
            res.json({
                ok: false,
                errors: errors.mapped()
            });
        }
    },
    token: (req, res) => {
        jwt.verify(req.query.token, process.env.SECRET, (err, usuario) => {
            if (!err) {
                db.Usuario.update({ estaActivo: 1 }, { where: { email: usuario.email } })
                    .then(() => {
                        db.Usuario.findOne({ where: { email: usuario.email } })
                            .then(usuario => {
                                req.session.usuario = usuario;
                                return res.json({
                                    ok: true,
                                    msg: "Usuario activado correctamente, sesión iniciada",
                                    urls: {
                                        character: `http://localhost:${process.env.PORT || "3001"}/characters`,
                                        movies: `http://localhost:${process.env.PORT || "3001"}/movies`
                                    },
                                    data: usuario
                                })
                            })
                    })
                    .catch(e => console.log(e))
            } else {
                console.log(e)
            }

        })
    }
}