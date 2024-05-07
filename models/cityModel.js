import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';

class City extends Model {}
City.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
  },
  {
    sequelize: db,
    modelName: 'City',
    tableName: 'cities',
    timestamps: true,
  }
);

export default City;
