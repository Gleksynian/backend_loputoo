import BrandModel from './brandModel.js'
import CarModel from './carModel.js'
import CityModel from './cityModel.js'
import FavoriteModel from './favoriteModel.js'
import ModelModel from './modelModel.js'
import UserModel from './userModel.js'

export default [
    CarModel.belongsTo(BrandModel, {foreignKey:'brand'}),
    BrandModel.hasMany(CarModel, {foreignKey:'brand'}),

    CarModel.belongsTo(ModelModel, {foreignKey:'model'}),
    ModelModel.hasMany(CarModel, {foreignKey:'model'}),

    CarModel.belongsTo(CityModel, {foreignKey:'city_id'}),
    CityModel.hasMany(CarModel, {foreignKey:'city_id'}),

    UserModel.hasOne(CarModel, {foreignKey:'owner'}),
    CarModel.belongsTo(UserModel, {foreignKey:'owner'}),

    UserModel.belongsToMany(CarModel, {foreignKey: 'user_id', through: FavoriteModel}),
    CarModel.belongsToMany(UserModel, {foreignKey: 'car_id', through: FavoriteModel}),

    CarModel.hasMany(FavoriteModel, {foreignKey:'car_id'}),
    FavoriteModel.belongsTo(CarModel, {foreignKey:'car_id'}),
]