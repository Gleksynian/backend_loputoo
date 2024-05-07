import jwt from 'jsonwebtoken';
import CarModel from '../models/carModel.js'

export const verifyToken = (req, res, next) => {
    const {token} = req.headers;
    if (!token) return res.sendStatus(401);
    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) => {
        if (err) return res.sendStatus(403);
        req.authUser = {"id":decoded.userId, "email":decoded.email};
        next();
    });
};

export const isOwner = async (req, res, next) => {
    const {id} = req.params
    const car = await CarModel.findByPk(id)
    const userId = req.authUser.id
    if (car.owner !== userId) {
        return res.sendStatus(403)
    }
    next()
}