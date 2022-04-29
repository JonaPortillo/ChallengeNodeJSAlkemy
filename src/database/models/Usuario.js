module.exports = (sequelize, dataTypes) => {

    const alias = "Usuario"; // Nombre a usar en consutar en db, db.ejemplo

    const cols = {
        id: {
            type: dataTypes.INTEGER(10).UNSIGNED,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        email: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        pass: {
            type: dataTypes.STRING(200),
            allowNull: false,
        },
        estaActivo: {
            type: dataTypes.INTEGER(10).UNSIGNED,
        },
    }

    const config = {
        tableName: 'usuarios',
        timestamps: false,
    }

    const Usuario = sequelize.define(alias, cols, config);

    return Usuario
}