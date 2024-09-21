const AuthService = require('../services/auth.service');

const getToken = async (req, res) => {
    try {
        const token = await AuthService.getToken();
        res.json({
            message: 'Token generado (valido por 3 horas)',
            token: `Bearer ${token}`
        })
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getToken };