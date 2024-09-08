const mongoose = require('mongoose');
require('dotenv').config({ path: __dirname + './env' })

let uri = process.env.DB_URI;
uri = uri.replace('<user>', process.env.DB_USER);
uri = uri.replace('<password>', process.env.DB_PASSWORD);
uri = uri.replace('<target>', process.env.DB_TARGET);

const connectToDataBase = async (uri) => {
    try {
        await mongoose.connect(uri, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            serverSelectionTimeoutMS: 10000
        });
        console.log('Conexion exitosa a la BD.');
    } catch (error) {
        console.log('Error al conectar a la DB:', error.message);
        process.exit(1);
    }
};

connectToDataBase(uri);