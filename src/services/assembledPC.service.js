const assembledPCModel = require('../models/assembledPC.model');

class AssembledPCService {
    async getAssembledPC() {
        try {
            return await assembledPCModel.find().lean();
        } catch (error) {
            console.error('Error al buscar PCs armadas:', error);
            throw new Error(`Error al buscar PCs armadas: ${error.message}`);
        }
    }

    async addAssembledPC(assembledPC) {
        try {
            return await assembledPCModel.create(assembledPC);
        } catch (error) {
            console.log('Error al agregar la PC armada:', error);
            throw new Error(`Error al agregar la PC armada: ${error.message}`);
        }
    }

    async updateAssembledPC(newAssembledPC) {
        try {
            const updateAssembledPC = await assembledPCModel.findOneAndUpdate(
                { _id: newAssembledPC._id },
                { $set: newAssembledPC },
                { new: true }
            );

            if (!updateAssembledPC) {
                throw new Error('No se ha encontrado la PC armada')
            }

            return updateAssembledPC;
        } catch (error) {
            console.log('Error al actualizar la PC armada:', error);
            throw new Error(`Error al actualizar la PC armada:${error.message}`);
        }
    }
}

module.exports = new AssembledPCService();