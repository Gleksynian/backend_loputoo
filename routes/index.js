import { Router } from 'express';
import carRouter from './carRoutes.js'
import userRouter from './userRoutes.js'
import cityRouter from './cityRoutes.js'

const router = new Router();
router.use('/cars', carRouter)
router.use('/cities',cityRouter)
router.use('/users', userRouter)

export default router;