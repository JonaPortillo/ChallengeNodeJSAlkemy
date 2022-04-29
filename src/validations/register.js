const { check, body } = require('express-validator');
const db = require('../dataBase/models');

const Usuario = db.Usuario;

module.exports = [
    check('email')
        .notEmpty()
        .withMessage('Debes ingresar un email')
        .isEmail()
        .withMessage('Debes ingresar un email válido'),

    body('email').custom((value) => {
        return Usuario.findOne({
            where: {
                email: value,
            }
        })
            .then((user) => {
                if (user) {
                    return Promise.reject('Email ya registrado')
                }
            })

    }),

    check('pass')
        .notEmpty()
        .withMessage('Debes escribir tu contraseña')
        .isLength({
            min: 6,
            max: 12
        })
        .withMessage('La contraseña debe tener entre 6 y 12 caracteres'),
]
