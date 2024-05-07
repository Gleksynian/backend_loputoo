import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';
import UserModel from './userModel.js';
import User from './userModel.js';

class Car extends Model { }
Car.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    brand: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    model: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    year: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    mileage: {
      type: DataTypes.INTEGER,
    },
    drivetrain: {
      type: DataTypes.STRING(40),
      allowNull: false,
    },
    fuel: {
      type: DataTypes.STRING(30),
      allowNull: false,
    },
    transmission: {
      type: DataTypes.STRING(40),
      allowNull: false,
    },
    engine: {
      type: DataTypes.STRING(40),
      allowNull: false,
    },
    color: {
      type: DataTypes.STRING(40),
      allowNull: false,
    },
    number: {
      type: DataTypes.STRING(15),
      allowNull: false,
    },
    price: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    owner: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: User,
        key: "id"
      }
    },
    description: {
      type: DataTypes.TEXT,
    },
  },
  {
    sequelize: db,
    modelName: 'Car',
    tableName: 'cars',
    timestamps: true,
  }
);

export default Car;
