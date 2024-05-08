import CarModel from '../models/carModel.js'
import { v4 as uuidv4 } from "uuid";
import path from "path";
import { fileURLToPath } from 'url';
import ImageModel from '../models/imageModel.js'

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const types = {
    "image/png": ".png",
    "image/jpg": ".jpg",
    "image/jpeg": ".jpeg",
    "image/webp": ".webp",
}

export const create = async (req, res) => {
    const car = JSON.parse(req.body.car);
    const { img } = req.files;
    console.log(img);
    car.owner = req.authUser.id

    const newCar = await CarModel.create(car)
    let filename = uuidv4() + types[img.mimetype];
    img.mv(path.resolve(__dirname, '..', 'static', filename));
    ImageModel.create({ "car_id": newCar.id, "url": filename })
    return res.json(newCar)
}
export const findAll = async (req, res) => {
    const car = await CarModel.findAll()
    return res.json(car)
}
export const findById = async (req, res) => {
    const { id } = req.params;
    const car = await CarModel.findByPk(id)
    return res.json(car)
}
export const update = async (req, res) => {
    const { id } = req.params;
    const { car } = req.body;
    const updatedCar = await CarModel.update(car, { where: { id: id } })
    return res.json(updatedCar)
}
export const remove = async (req, res) => {
    const { id } = req.params;
    const car = await CarModel.destroy({ where: { id: id } })
    return res.json(car)
}