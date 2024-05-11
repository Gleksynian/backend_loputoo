import express from 'express';
import cors from 'cors';
import 'dotenv/config'
import db from './dbConnect.js';
import router from './routes/index.js';
import fileUpload from 'express-fileupload';
import path from 'path';
import { fileURLToPath } from 'url';
import models from './models/index.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

try {
    await db.authenticate();
    await db.sync();
    console.log('Database connected');
} catch (error) {
    console.log('Connection error: ', error);
}
app.use(cors({}));
// app.use(cors({ credentials: true, origin: 'http://localhost:3000/' }));
app.use(express.json());
app.use(express.static(path.resolve(__dirname, 'static')))
app.use(express.urlencoded({ extended: true }));
app.use(fileUpload({}));
app.use(router)

app.listen(5000, () => console.log('Server running at port 5000'));