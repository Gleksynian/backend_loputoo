import express from 'express';
import { create, findAll, remove, find } from '../controllers/favoriteController.js';
import { verifyToken } from '../middleware/middleware.js';

const router = express.Router();

router.post('/:carId', verifyToken, create,);
router.get('/', verifyToken, findAll);
router.get('/:carId', verifyToken, find);
router.delete('/:carId', verifyToken, remove);

export default router;