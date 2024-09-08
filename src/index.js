const express = require('express');
const morgan = require('morgan');
const os = require('os');
const networkInterfaces = os.networkInterfaces();
require('dotenv').config({ path: __dirname + '/config/.env' });

let ipAddresses = [];
for (let interface in networkInterfaces) {
    for(let alias of networkInterfaces[interface]) {
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

// Server is listening
app.listen(app.get('port'), () => {
    console.log(`Servidor en el puerto ${app.get('port')}`);
    ipAddresses.forEach(ip => {
        console.log(`Accede a la API desde ---> http://${ip}:${app.get('port')}`);
    })
});