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
    const car = await CarModel.findAll({ include: [{ model: Brand }, { model: Moodel }, { model: City }, { model: User }] })
    return res.json(car)
}
export const findById = async (req, res) => {
    const { id } = req.params;
    const car = await CarModel.findByPk(id, { include: [{ model: Brand }, { model: Moodel }, { model: City }, { model: User }] })
    return res.json(car)
}
export const update = async (req, res) => {
    const { id } = req.params;
    const car = JSON.parse(req.body.car);
    car.owner = req.authUser.id;

    if (req.files && req.files.img) {
        const img = req.files.img;
        const filename = uuidv4() + types[img.mimetype];
        car.image = filename;
        await img.mv(path.resolve(__dirname, '..', 'static', filename));
    }

    const [updated] = await CarModel.update(car, { where: { id: id } });

    if (updated === 0) {
        return res.status(404).json({ message: 'Car not found or no update made' });
    }

    const updatedCar = await CarModel.findByPk(id);
    return res.json({ message: 'Car updated successfully', car: updatedCar });
};
export const remove = async (req, res) => {
    const { id } = req.params;
    const car = await CarModel.destroy({ where: { id: id } })
    return res.json(car)
}