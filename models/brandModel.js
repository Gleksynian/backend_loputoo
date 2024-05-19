import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';

class Brand extends Model { }
Brand.init(
    {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
    },
    {
        sequelize: db,
        modelName: 'Brand',
        tableName: 'brands',
        timestamps: true,
    }
);

export default Brand;