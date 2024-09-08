const assembledPCModel = require('../models/assembledPC.model');

class assembledPCService {
    assembledPCService() {}

    async getAssembledPC() {
        try {
            return await assembledPCModel.find().lean();
        } catch (error) {
            return error;
        }
    }
}

module.exports = new assembledPCService();