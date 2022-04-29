let { check } = require('express-validator')

module.exports = [
    check('titulo')
        .notEmpty()
        .withMessage('Ingrese un titulo a la película o serie'),

    check('imagen')
        .notEmpty()
        .withMessage('Ingrese una imagen para la película o serie')
        .isLength({ max: 400 })
        .withMessage('Maximo 400 caracteres'),


    check('fecha_creacion')
        .isDate()
        .withMessage('Debe ingresar una fecha vallida, anterior a hoy. "aaaa-mm-dd"'),

    check('calificacion')
        .optional()
        .isFloat({ min: 1, max: 5 })
        .withMessage('Debe ingresar un numero entre 1 y 5'),

    check('genero_id')
        .optional()
        .isFloat({ min: 1, max: 5 })//Depende de la cantidad de géneros
        .withMessage('Debe ingresar un numero entre 1 y 5'),//Depende de la cantidad de géneros

]
