import UserModel from '../models/userModel.js'
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

export const register = async (req, res) => {
    const {user} = req.body;
    if (user.password !== user.confirmPassword) {
        return res.json({"error":"passwords not match"})
    }
    const hashedPassword = await bcrypt.hash(user.password, 8);
    user.password = hashedPassword;
    const newUser = await UserModel.create(user);
    return res.json(newUser)
}

export const login = async (req, res) => {
    const {user} = req.body;
    const existUser = await UserModel.findOne({
        where: {
            email:user.email
        },
    });
    const match = await bcrypt.compare(user.password, existUser.password);
    if (!match) return res.status(400).json({ msg: 'Wrong Password' });
    const userId = existUser.id;
    const email = existUser.email;
    const accessToken = jwt.sign({ userId, email },
        process.env.ACCESS_TOKEN_SECRET, {
        expiresIn: '1d',
    });
    res.cookie('token', accessToken, {
        httpOnly: true,
        maxAge: 24 * 60 * 60 * 1000,
    });
    res.json({ accessToken, existUser });

};
export const findAll = async (req, res) => {
    const user = await UserModel.findAll()
    return res.json(user)
}
export const findById = async (req, res) => {
    const {id} = req.params;
    const user = await UserModel.findByPk(id)
    return res.json(user)
}
export const update = async (req, res) => {
    const {id} = req.params;
    const {user} = req.body;
    const updatedUser = await UserModel.update(user, {where:{id:id}})
    return res.json(updatedUser)
}
export const remove = async (req, res) => {
    const {id} = req.params;
    const user = await UserModel.destroy({where:{id:id}})
    return res.json(user)
}