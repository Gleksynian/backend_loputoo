import BrandModel from './brandModel.js'
import CarModel from './carModel.js'
import CityModel from './cityModel.js'
import FavoriteModel from './favoriteModel.js'
import ModelModel from './modelModel.js'
import UserModel from './userModel.js'

export default [
    CarModel.hasOne(BrandModel, {foreignKey:'car_id'}),
    BrandModel.belongsTo(CarModel, {foreignKey:'car_id', onDelete:'CASCADE'}),

    CarModel.hasOne(ModelModel, {foreignKey:'car_id'}),
    ModelModel.belongsTo(CarModel, {foreignKey:'car_id', onDelete:'CASCADE'}),

    CarModel.belongsTo(CityModel, {foreignKey:'city_id'}),
    CityModel.hasOne(CarModel, {foreignKey:'city_id', onDelete:'CASCADE'}),

    UserModel.hasOne(CarModel, {foreignKey:'owner'}),
    CarModel.belongsTo(UserModel, {foreignKey:'owner'}),
]