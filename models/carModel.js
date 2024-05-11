import db from '../dbConnect.js';
import { DataTypes, Model } from 'sequelize';
import User from './userModel.js';
import Moodel from './modelModel.js';
import Brand from './brandModel.js';
import City from './cityModel.js';

class Car extends Model { }
Car.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    brand: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Brand,
        key: "id"
      }
    },
    model: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Moodel,
        key: "id"
      }
    },
    bodyType: {
      type: DataTypes.STRING(50),
      allowNull:false,
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
    power: {
      type: DataTypes.STRING(30),
      allowNull:false,
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
    image: {
      type: DataTypes.STRING,
    },
    city_id: {
      type: DataTypes.INTEGER,
      references: {
        model: City,
        key: "id"
      }
    }
  },
  {
    sequelize: db,
    modelName: 'Car',
    tableName: 'cars',
    timestamps: true,
  }
);

export default Car;
