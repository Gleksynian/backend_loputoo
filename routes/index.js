import { Router } from 'express';
import carRouter from './carRoutes.js'
import userRouter from './userRoutes.js'
import cityRouter from './cityRoutes.js'
import modelRoutes from './modelRoutes.js'
import brandRoutes from './brandRoutes.js'
import express from 'express';

const router = new Router();

const testRouter = express.Router()
testRouter.get('/', async (req, res) => {return res.json("test OK")})

router.use('/test', testRouter)
router.use('/cars', carRouter)
router.use('/cities',cityRouter)
router.use('/users', userRouter)
router.use('/models', modelRoutes)
router.use('/brands', brandRoutes)

export default router;