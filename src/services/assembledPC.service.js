const assembledPCModel = require('../models/assembledPC.model');

class assembledPCService {
    assembledPCService() {}

    async getAssembledPC() {
        try {
            return await assembledPCModel.find().lean();
        } catch (error) {
            console.error('Error al buscar PCs armadas:', error);
            throw new Error('Error al buscar PCs armadas')
        }
    }
}

module.exports = new assembledPCService();