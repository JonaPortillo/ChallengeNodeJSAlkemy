let { check } = require('express-validator')


module.exports = [
    check('nombre')
        .notEmpty()
        .withMessage('Ingrese un nombre al personaje'),

    check('imagen')
        .notEmpty()
        .withMessage('Ingrese una imagen para el personaje')
        .isLength({ max: 400 })
        .withMessage('Maximo 400 caracteres'),


    check('peso')
        .optional()
        .isNumeric()
        .withMessage('Debe ingresar numeros para el peso'),

    check('edad')
        .optional()
        .isNumeric()
        .withMessage('Debe ingresar numeros para el peso'),

]