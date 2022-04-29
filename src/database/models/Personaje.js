module.exports = (sequelize, dataTypes) => {

    const alias = "Personaje"; // Nombre a usar en consutar en db, db.ejemplo

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
            type: dataTypes.STRING(400),
            allowNull: false,
        },
        peso: {
            type: dataTypes.DECIMAL(3, 1),
        },
        edad: {
            type: dataTypes.INTEGER(10).UNSIGNED
        },
        historia: {
            type: dataTypes.TEXT()
        },
    }

    const config = {
        tableName: 'personajes',
        timestamps: false,
    }

    const Personaje = sequelize.define(alias, cols, config);


    Personaje.associate = (models) => {
        Personaje.belongsToMany(models.PeliSerie, {
            as: "pelis_series",
            through: 'personajes_pelis_series',
            foreignKey: "id_personaje",
            otherKey: "id_peli_serie",
            timestamps: false
        })
    }

    return Personaje;
}