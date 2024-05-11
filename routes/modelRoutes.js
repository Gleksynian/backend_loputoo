import express from 'express';
import { create, findById, findAll, update, remove } from '../controllers/modelController.js';
import { verifyToken } from '../middleware/middleware.js';

const router = express.Router();

router.post('/',verifyToken, create);
router.get('/', findAll);
router.get('/:id', findById);
router.patch('/:id', verifyToken, update);
router.delete('/:id', verifyToken, remove);

export default router;