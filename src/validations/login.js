let { check, body } = require('express-validator');
const bcrypt = require('bcryptjs');
const db = require('../database/models');
const Usuario = db.Usuario;


module.exports = [
    check('email')
        .notEmpty()
        .withMessage('Debes ingresar un email').bail()
        .isEmail()
        .withMessage('Debes ingresar un email válido').bail(),


    check('pass')
        .notEmpty()
        .withMessage('Debes escribir tu contraseña').bail(),

    body('custom')
        .custom((value, { req }) => {
            return Usuario.findOne({
                where: {
                    email: req.body.email
                }
            })
                .then(user => {
                    if (!bcrypt.compareSync(req.body.pass, user.dataValues.pass)) {
                        return Promise.reject()
                    }
                })
                .catch(() => {
                    return Promise.reject("Email o contraseña invalidos")
                })
        })
]