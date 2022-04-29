require('dotenv').config();
const db = require('../database/models');
const { Op } = require("sequelize");
const { validationResult } = require('express-validator');

module.exports = {
    list: (req, res) => {
        db.Personaje.findAll({
            attributes: ['nombre', 'imagen'],
            include: [{ association: "pelis_series" }]
        })
            .then(personajes => {
                return res.json({
                    ok: true,
                    total: personajes.length,
                    url: '/characters',
                    data: personajes
                });
            })
            .catch(e => console.log(e))
    },
    detail: (req, res) => {
        db.Personaje.findOne({
            where: {
                id: req.params.id
            }
        })
            .then(personaje => {
                if (personaje != null) {
                    return res.json({
                        ok: true,
                        data: personaje,
                        url: ('/characters/detail/' + req.params.id),
                    });
                } else {
                    return res.json({
                        ok: false,
                        msg: 'Personaje no encontrado',
                        url: ('/characters/detail/' + req.params.id),
                    });
                }
            })
            .catch(e => console.log(e))
    },
    search: (req, res) => {
        if (req.query.name) {
            db.Personaje.findAll({
                where: {
                    nombre: { [Op.like]: '%' + req.query.name + '%' }
                }
            })
                .then(personajes => {
                    res.json({
                        ok: true,
                        total: personajes.length,
                        url: '/characters/search?name=' + req.query.name,
                        data: personajes
                    });
                })
                .catch(e => console.log(e))
        } else {
            if (req.query.age) {
                db.Personaje.findAll({
                    where: {
                        edad: { [Op.eq]: req.query.age }
                    }
                })
                    .then(personajes => {
                        return res.json({
                            ok: true,
                            total: personajes.length,
                            url: '/characters/search?age=' + req.query.age,
                            data: personajes
                        });
                    })
                    .catch(e => console.log(e))
            } else {
                if (req.query.movies) {
                    db.PeliSerie.findByPk(
                        req.query.movies, {
                        include: [{ association: "personajes" }]
                    })
                        .then(pelicula => {
                            if (pelicula) {
                                return res.json({
                                    ok: true,
                                    total: pelicula.personajes.length,
                                    url: `/characters/seacrh?movies=${req.query.movies}`,
                                    pelicula: pelicula.titulo,
                                    data: pelicula.personajes
                                });
                            }
                            return res.json({
                                ok: false,
                                msj: "No existe ninguna película con ese ID",
                                url: '/characters/seacrh?idMovie=' + req.query.movies,
                                data: []
                            });
                        })
                        .catch(e => console.log(e))
                } else {
                    return res.json({
                        msg: "Query incorrecta",
                        ok: false,
                        total: 0,
                        url: '/characters/search',
                        data: []
                    });
                }
            }
        }
    },
    create: (req, res) => {
        let errors = validationResult(req);

        if (!errors.isEmpty()) {
            return res.json({
                ok: false,
                errors: errors.mapped()
            })
        }
        db.Personaje.create({
            nombre: req.body.nombre,
            imagen: req.body.imagen,
            edad: req.body.edad,
            peso: req.body.peso,
            historia: req.body.historia,
        })
            .then(() => {
                return res.json({
                    msg: "Personaje guardado correctamente",
                    ok: true,
                    url: '/characters/create',
                    allCharacters: `http://localhost:${process.env.PORT || "3001"}/characters`,
                    data: req.body
                });
            })
            .catch(e => console.log(e))
    },
    edit: (req, res) => {
        let errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.json({
                ok: false,
                errors: errors.mapped()
            })
        }
        db.Personaje.update({
            ...req.body
        }, {
            where: {
                id: req.params.id
            }
        })
            .then(personaje => {
                if (personaje != 0) {
                    return res.json({
                        msg: "Personaje editado correctamente",
                        ok: true,
                        url: '/characters/edit/' + req.params.id
                    });
                } else {
                    return res.json({
                        msg: "No se enconotró ningún personaje con ese id, o el campo a cambiar ya tenía ese valor",
                        ok: false,
                        url: '/characters/edit/' + req.params.id
                    });
                }

            })
            .catch(e => console.log(e))
    },
    delete: (req, res) => {
        db.Personaje.destroy({
            where: {
                id: req.params.id
            }
        })
            .then((result) => {
                if (result) {
                    return res.json({
                        msg: "Personaje elminado correctamente",
                        ok: true,
                        url: '/characters/delete/' + req.params.id,
                        allCharacters: `http://localhost:${process.env.PORT || "3001"}/characters`,
                    });
                } else {
                    return res.json({
                        msg: "No se enconotró ningún personaje con ese id",
                        ok: false,
                        url: '/characters/delete/' + req.params.id,
                        allCharacters: `http://localhost:${process.env.PORT || "3001"}/characters`,
                    });
                }

            })
            .catch(e => console.log(e))
    }
}

