const express = require('express');
const morgan = require('morgan');
const os = require('os');
const networkInterfaces = os.networkInterfaces();
const { generateToken } = require('../src/middleware/auth')
require('dotenv').config({ path: __dirname + '/config/.env' });

let ipAddresses = [];
for (let interface in networkInterfaces) {
    for (let alias of networkInterfaces[interface]) {
        if (alias.family === 'IPv4' && !alias.internal) {
            ipAddresses.push(alias.address);
        }
    }
}

// Inicialization
const app = express();
require('./config/database');

// Settings
app.set('port', process.env.PORT || 5000);

// Middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json())
app.use(morgan('dev'));

// Routes
app.use(require('./routes/assembledPC.route'));
app.use(require('./routes/case.route'));
app.use(require('./routes/cooler.route'));
app.use(require('./routes/cpu.route'));
app.use(require('./routes/gpu.route'));
app.use(require('./routes/motherboard.route'));
app.use(require('./routes/psu.route'));
app.use(require('./routes/ram.route'));
app.use(require('./routes/storage.route'));

// Server is listening
app.listen(app.get('port'), () => {
    const token = generateToken();
    console.log(`Servidor en el puerto ${app.get('port')}\n`);
    console.log(`Token generado (valido por 3 horas):\n${token}\n`)
    ipAddresses.forEach(ip => {
        console.log(`Accede a la API desde ---> http://${ip}:${app.get('port')}`);
    })
});