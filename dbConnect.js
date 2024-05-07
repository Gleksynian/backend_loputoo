import { Sequelize } from 'sequelize';
console.log(process.env.DATABASE_NAME);
const db = new Sequelize(process.env.DATABASE_NAME, process.env.DATABASE_USERNAME, process.env.DATABASE_PASSWORD, {
 host: 'localhost',
 dialect: 'mysql',
});

export default db;