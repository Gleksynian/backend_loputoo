import CarModel from '../models/carModel.js'
import { v4 as uuidv4 } from "uuid";
import path from "path";
import { fileURLToPath } from 'url';
import Brand from '../models/brandModel.js';
import Moodel from '../models/modelModel.js';
import City from '../models/cityModel.js';
import User from '../models/userModel.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const types = {
    "image/png": ".png",
    "image/jpg": ".jpg",
    "image/jpeg": ".jpeg",
    "image/webp": ".webp",
    "image/avif": ".avif",
    "image/bmp": ".bmp",
    "image/tiff": ".tiff",
    "image/svg+xml": ".svg",
    "image/x-icon": ".ico"
}

export const create = async (req, res) => {
    const car = JSON.parse(req.body.car);
    const { img } = req.files;
    car.owner = req.authUser.id
    let filename = uuidv4() + types[img.mimetype];
    car.image = filename
    const newCar = await CarModel.create(car)
    img.mv(path.resolve(__dirname, '..', 'static', filename));
    return res.json(newCar)
}
export const findAll = async (req, res) => {
    const car = await CarModel.findAll({include:[{model:Brand}, {model:Moodel}, {model:City}, {model: User}]})
    return res.json(car)
}
export const findById = async (req, res) => {
    const { id } = req.params;
    const car = await CarModel.findByPk(id, {include:[{model:Brand}, {model:Moodel}, {model:City}, {model: User}]})
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