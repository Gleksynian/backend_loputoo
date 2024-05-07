import express from 'express';
import { create, findById, findAll, update, remove } from '../controllers/carController.js';
import { verifyToken } from '../middleware/middleware.js';
import { isOwner } from '../middleware/middleware.js';

const router = express.Router();

router.post('/',verifyToken, create);
router.get('/', findAll);
router.get('/:id', findById);
router.patch('/:id', verifyToken, isOwner, update);
router.delete('/:id', verifyToken, isOwner, remove);

export default router;