import CityModel from '../models/cityModel.js'

export const create = async (req, res) => {
    const {city} = req.body;
    const newCity = await CityModel.create(city)
    return res.json(newCity)
}
export const findAll = async (req, res) => {
    const city = await CityModel.findAll()
    return res.json(city)
}
export const findById = async (req, res) => {
    const {id} = req.params;
    const city = await CityModel.findByPk(id)
    return res.json(city)
}
export const update = async (req, res) => {
    const {id} = req.params;
    const {city} = req.body;
    const updatedCity = await CityModel.update(city, {where:{id:id}})
    return res.json(updatedCity)
}
export const remove = async (req, res) => {
    const {id} = req.params;
    const city = await CityModel.destroy({where:{id:id}})
    return res.json(city)
}