module.exports = (sequelize, dataTypes) => {

    const alias = "Genero"; // Nombre a usar en consutar en db, db.ejemplo

    const cols = {
        id: {
            type: dataTypes.INTEGER(10).UNSIGNED,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        nombre: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        imagen: {
            type: dataTypes.STRING(200),
            allowNull: false,
        },
    }

    const config = {
        tableName: 'generos',
        timestamps: false,
    }

    const Genero = sequelize.define(alias, cols, config);

    Genero.associate = (models) => {
        Genero.hasMany(models.PeliSerie, {
            as: "pelis_series",
            foreignKey: "genero_id"
        })
    }

    return Genero
}