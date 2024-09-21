const { generateToken } = require('../middleware/auth');

class Authorization {
    async getToken() {
        try {
            return await generateToken();
        } catch (error) {
            console.log('Hubo un error al generar el token:', error);
            throw new Error(`Hubo un error al generar el token: ${error.message}`)
        }
    }
}

module.exports = new Authorization();