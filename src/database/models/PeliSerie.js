module.exports = (sequelize, dataTypes) => {

    const alias = "PeliSerie"; // Nombre a usar en consutar en db, db.ejemplo

    const cols = {
        id: {
            type: dataTypes.INTEGER(10).UNSIGNED,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        titulo: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        imagen: {
            type: dataTypes.STRING(200),
            allowNull: false,
        },
        calificacion: {
            type: dataTypes.INTEGER(10).UNSIGNED
        },
        fecha_creacion: {
            type: dataTypes.DATE
        },
        genero_id: {
            type: dataTypes.INTEGER(10).UNSIGNED
        }
    }

    const config = {
        tableName: 'pelis_series',
        timestamps: false,
    }

    const PeliSerie = sequelize.define(alias, cols, config);

    PeliSerie.associate = (models) => {
        PeliSerie.belongsTo(models.Genero, {
            as: "genero",
            foreignKey: "genero_id"
        }),
            PeliSerie.belongsToMany(models.Personaje, {
                as: "personajes",
                through: 'personajes_pelis_series',
                foreignKey: "id_peli_serie",
                otherKey: "id_personaje",
                timestamps: false
            })
    }

    return PeliSerie;
}