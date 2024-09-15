const jwt = require('jsonwebtoken');
require('dotenv').config({ path: __dirname + '../config/.env' })

function validateJWT(req, res, next) {
    const authHeader = req.header('Authorization');
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({ message: 'No hay token en la peticion o formato incorrecto' });
    }

    const token = authHeader.split(" ")[1];

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: 'Token no valido' });
    }
}

function generateToken() {
    const payload = {
        user: 'Admin',
        role: 'Admin'
    };

    const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '3h' });
    return token;
}

module.exports = { validateJWT, generateToken };