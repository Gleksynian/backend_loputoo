import Moodel from '../models/modelModel.js'

export const create = async (req, res) => {
    const { model } = req.body;
    const newModel = await Moodel.create(model)
    return res.json(newModel)
}
export const findAll = async (req, res) => {
    const model = await Moodel.findAll()
    return res.json(model)
}
export const findById = async (req, res) => {
    const { id } = req.params;
    const model = await Moodel.findByPk(id)
    return res.json(model)
}
export const update = async (req, res) => {
    const { id } = req.params;
    const { model } = req.body;
    const updatedModel = await Moodel.update(model, { where: { id: id } })
    return res.json(updatedModel)
}
export const remove = async (req, res) => {
    const { id } = req.params;
    const model = await Moodel.destroy({ where: { id: id } })
    return res.json(model)
}