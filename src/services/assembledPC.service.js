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
            const updatedAssembledPC = await assembledPCModel.findOneAndUpdate(
                { _id: newAssembledPC._id },
                { $set: newAssembledPC },
                { new: true }
            );
            if (!updatedAssembledPC) {
                throw new Error('No se ha encontrado la PC armada')
            }

            return updatedAssembledPC;
        } catch (error) {
            console.log('Error al actualizar la PC armada:', error);
            throw new Error(`Error al actualizar la PC armada:${error.message}`);
        }
    }

    async deleteAssembledPC(idAssembledPC) {
        try {
            const deletedAssembledPC = await assembledPCModel.findOneAndDelete({ _id: idAssembledPC });
            if (!deletedAssembledPC) {
                throw new Error('No se ha encontrado la PC armada');
            }

            return deletedAssembledPC;
        } catch (error) {
            console.log('Error al elimminar la PC armada:', error);
            throw new Error(`Error al eliminar laa PC armada: ${error.message}`);
        }
    }
}

module.exports = new AssembledPCService();