import UserModel from '../models/userModel.js';
import CarModel from '../models/carModel.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

export const register = async (req, res) => {
    const { user } = req.body;

    if (user.password !== user.confirmPassword) {
        return res.status(400).json({ error: "Passwords do not match" });
    }

    const existingEmail = await UserModel.findOne({ where: { email: user.email } });
    if (existingEmail) {
        return res.status(400).json({ error: "Email is already in use" });
    }

    const existingPhone = await UserModel.findOne({ where: { phone: user.phone } });
    if (existingPhone) {
        return res.status(400).json({ error: "Phone number is already in use" });
    }

    const hashedPassword = await bcrypt.hash(user.password, 8);
    user.password = hashedPassword;

    try {
        const newUser = await UserModel.create(user);
        return res.status(201).json(newUser);
    } catch (error) {
        return res.status(500).json({ error: "Internal server error" });
    }
};


export const login = async (req, res) => {
    const { user } = req.body;

    try {
        const existUser = await UserModel.findOne({ where: { email: user.email } });

        if (!existUser) {
            return res.status(400).json({ error: "User not found" });
        }

        const match = await bcrypt.compare(user.password, existUser.password);
        if (!match) {
            return res.status(400).json({ error: "Incorrect password" });
        }

        const userId = existUser.id;
        const email = existUser.email;
        const accessToken = jwt.sign({ userId, email }, process.env.ACCESS_TOKEN_SECRET, {
            expiresIn: '1d',
        });

        res.cookie('token', accessToken, {
            httpOnly: false,
            maxAge: 24 * 60 * 60 * 1000,
        });

        return res.json({ accessToken, existUser });
    } catch (error) {
        return res.status(500).json({ error: "Internal server error" });
    }
};


export const findAll = async (req, res) => {
    const users = await UserModel.findAll();
    return res.json(users);
};

export const findById = async (req, res) => {
    const { id } = req.params;
    const user = await UserModel.findByPk(id);
    return res.json(user);
};

export const update = async (req, res) => {
    const { id } = req.params;
    const updates = req.body;

    try {
        if (updates.email) {
            const existingEmail = await UserModel.findOne({
                where: { email: updates.email },
            });

            if (existingEmail && existingEmail.id !== parseInt(id, 10)) {
                return res.status(400).json({ error: 'Email is already in use' });
            }
        }

        if (updates.phone) {
            const existingPhone = await UserModel.findOne({
                where: { phone: updates.phone },
            });

            if (existingPhone && existingPhone.id !== parseInt(id, 10)) {
                return res.status(400).json({ error: 'Phone number is already in use' });
            }
        }

        if (updates.oldPassword && updates.newPassword) {
            const user = await UserModel.findByPk(id);
            const isMatch = await bcrypt.compare(updates.oldPassword, user.password);
            if (!isMatch) {
                return res.status(400).json({ error: 'Old password is incorrect' });
            }
            updates.password = await bcrypt.hash(updates.newPassword, 8);
            delete updates.oldPassword;
            delete updates.newPassword;
        }

        await UserModel.update(updates, { where: { id: id } });
        const updatedUser = await UserModel.findByPk(id);
        return res.json(updatedUser);
    } catch (error) {
        return res.status(500).json({ error: 'Internal server error' });
    }
};


export const remove = async (req, res) => {
    const { id } = req.params;
    await UserModel.destroy({ where: { id: id } });
    return res.json({ success: true });
};

export const findCarsByUserId = async (req, res) => {
    const { id } = req.params;
    const cars = await CarModel.findAll({
        where: {
            owner: id,
        },
    });
    return res.json(cars);
};