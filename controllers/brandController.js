import Brand from '../models/brandModel.js'

export const create = async (req, res) => {
    const {brand} = req.body;
    const newBrand = await Brand.create(brand)
    return res.json(newBrand)
}
export const findAll = async (req, res) => {
    const brand = await Brand.findAll()
    return res.json(brand)
}
export const findById = async (req, res) => {
    const {id} = req.params;
    const brand = await Brand.findByPk(id)
    return res.json(brand)
}
export const update = async (req, res) => {
    const {id} = req.params;
    const {brand} = req.body;
    const updatedBrand = await Brand.update(brand, {where:{id:id}})
    return res.json(updatedBrand)
}
export const remove = async (req, res) => {
    const {id} = req.params;
    const brand = await Brand.destroy({where:{id:id}})
    return res.json(brand)
}