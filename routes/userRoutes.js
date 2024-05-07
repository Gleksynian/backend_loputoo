import express from 'express';
import { findById, findAll, update, remove, login, register } from '../controllers/userController.js';

const router = express.Router();

router.post('/login', login);
router.post('/register', register);
router.get('/', findAll);
router.get('/:id', findById);
router.patch('/:id', update);
router.delete('/:id', remove);

export default router;