import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';

class Image extends Model {}
Image.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    car_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    url: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
  },
  {
    sequelize: db,
    modelName: 'Image',
    tableName: 'images',
    timestamps: true,
  }
);

export default Image;
