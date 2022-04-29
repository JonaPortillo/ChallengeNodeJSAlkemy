const db = require('../database/models');
const { Op } = require("sequelize");
const { validationResult } = require('express-validator');

module.exports = {
    list: (req, res) => {
        db.PeliSerie.findAll({
            /* include: [{ association: "genero" }, { association: "personajes" }], */
            attributes: ['titulo', 'imagen', 'fecha_creacion']
        })
            .then((peliculas) => {
                return res.json({
                    ok: true,
                    total: peliculas.length,
                    url: '/movies',
                    data: peliculas
                });
            })
            .catch(e => console.log(e))
    },
    detail: (req, res) => {
        db.PeliSerie.findOne({
            where: {
                id: req.params.id
            },
            include: [{ association: "genero" }, { association: "personajes" }]
        })
            .then(peli_serie => {
                if (peli_serie != null) {
                    return res.json({
                        ok: true,
                        data: peli_serie,
                        url: ('/movies/detail/' + req.params.id),
                    });
                } else {
                    return res.json({
                        ok: false,
                        msg: 'Película no encontrado',
                        url: ('/characters/detail/' + req.params.id),
                    });
                }
            })
            .catch(e => console.log(e))
    },
    create: (req, res) => {
        let errors = validationResult(req);

        if (!errors.isEmpty()) {
            return res.json({
                ok: false,
                errors: errors.mapped()
            })
        }
        db.PeliSerie.create({
            ...req.body
        })
            .then(() => {
                return res.json({
                    msg: "Película guardada correctamente",
                    ok: true,
                    url: '/movies/create',
                    allMovies: `http://localhost:${process.env.PORT || "3001"}/movies`,
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
        db.PeliSerie.update({
            ...req.body
        }, {
            where: {
                id: req.params.id
            }
        })
            .then((valor) => {
                if (valor != 0) {
                    return res.json({
                        msg: "Película o Serie editada correctamente",
                        ok: true,
                        url: '/movies/edit/' + req.params.id
                    });
                } else {
                    return res.json({
                        msg: "No se enconotró ningúna película o serie con ese id, o el campo a cambiar ya tenía ese valor",
                        ok: false,
                        url: '/movies/edit/' + req.params.id
                    });
                }
            })
            .catch(e => console.log(e))
    },
    delete: (req, res) => {
        db.PeliSerie.destroy({
            where: {
                id: req.params.id
            }
        })
            .then((result) => {
                if (result) {
                    return res.json({
                        msg: "Peli o Serie elminada correctamente",
                        ok: true,
                        url: '/movies/delete/' + req.params.id,
                        allMovies: `http://localhost:${process.env.PORT || "3001"}/movies`,
                    });
                } else {
                    return res.json({
                        msg: "No se enconotró ningúna Película o Serie con ese id",
                        ok: false,
                        url: '/movies/delete/' + req.params.id,
                        allMovies: `http://localhost:${process.env.PORT || "3001"}/movies`,
                    });
                }

            })
            .catch(e => console.log(e))
    },
    search: (req, res) => {
        if (req.query.name) {
            db.PeliSerie.findAll({
                where: {
                    titulo: { [Op.like]: '%' + req.query.name + '%' }
                }
            })
                .then(peliculas => {
                    return res.json({
                        ok: true,
                        total: peliculas.length,
                        url: '/movies/search?name=' + req.query.name,
                        data: peliculas
                    });
                })
                .catch(e => console.log(e))
        } else {
            if (req.query.genre) {
                db.Genero.findByPk(req.query.genre, {
                    include: [{ association: "pelis_series" }]
                })
                    .then(genero => {
                        if (genero) {
                            return res.json({
                                ok: true,
                                total: genero.pelis_series.length,
                                url: '/movies/seacrh?genre=' + req.query.genre,
                                genero: genero.nombre,
                                data: genero.pelis_series
                            });
                        }
                        return res.json({
                            ok: false,
                            msj: "No existe ningun género con ese ID",
                            url: '/movies/seacrh?genre=' + req.query.genre,
                            data: []
                        });
                    })
                    .catch(e => console.log(e))
            } else {
                if (req.query.order == 'ASC' || req.query.order == 'DESC') {
                    db.PeliSerie.findAll({
                        order: [['titulo', req.query.order]]
                    })
                        .then(pelis_series => {
                            return res.json({
                                ok: true,
                                total: pelis_series.length,
                                url: '/movies/seacrh?order=' + req.query.order,
                                data: pelis_series
                            });
                        })
                        .catch(e => console.log(e))
                } else {
                    res.json({
                        msg: "Query incorrecta",
                        ok: false,
                        total: 0,
                        url: '/movies/search?',
                        data: []
                    });
                }
            }
        }
    },
}