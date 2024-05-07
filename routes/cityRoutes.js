import express from 'express';
import { create, findById, findAll, update, remove } from '../controllers/cityController.js';

const router = express.Router();

router.post('/', create);
router.get('/', findAll);
router.get('/:id', findById);
router.patch('/:id', update);
router.delete('/:id', remove);

export default router;