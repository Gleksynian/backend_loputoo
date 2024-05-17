import db from '../dbConnect.js';
import { DataTypes, Model} from 'sequelize';
import Brand from './brandModel.js';

class Moodel extends Model { }
Moodel.init(
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
        brand_id: {
            type: DataTypes.INTEGER,
            references: {
                model: Brand,
                key: "id"
            }
        }
    },
    {
        sequelize: db,
        modelName: 'Model',
        tableName: 'models',
        timestamps: true,
    }
);

export default Moodel;