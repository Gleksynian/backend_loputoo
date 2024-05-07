import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';

class Favorite extends Model {}
Favorite.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    car_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize: db,
    modelName: 'Favorite',
    tableName: 'favorites',
    timestamps: true,
  }
);

export default Favorite;
