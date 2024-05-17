import FavoriteModel from '../models/favoriteModel.js'
import CarModel from '../models/carModel.js'
import UserModel from '../models/userModel.js'
import BrandModel from '../models/brandModel.js';
import MoodelModel from '../models/modelModel.js';

export const create = async (req, res) => {
    const { carId } = req.params;
    const userId = req.authUser.id;
    const newFavorite = await FavoriteModel.create({ 'car_id': carId, 'user_id': userId })
    return res.json(newFavorite)
}
export const findAll = async (req, res) => {
    const userId = req.authUser.id;
    const favorites = await FavoriteModel.findAll({ where: {'user_id': userId}, include: [{ model: CarModel, include: [{ model: BrandModel}, {model: MoodelModel}]}]})
    return res.json(favorites)
}

export const find = async (req, res) => {
    const { carId } = req.params;
    const userId = req.authUser.id;
    const favorites = await FavoriteModel.findOne({ where: {'car_id': carId, 'user_id': userId} })
    if (favorites) {
        return res.json(true)
    }
    return res.json(false)
}

export const remove = async (req, res) => {
    const { carId } = req.params;
    const userId = req.authUser.id;
    const favorites = await FavoriteModel.destroy({ where: {'car_id': carId, 'user_id': userId} })
    return res.json(favorites)
}