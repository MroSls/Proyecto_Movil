const mbModel = require('../models/motherboard.model');

class MBService {
    async getMB() {
        try {
            return await mbModel.find().lean();
        } catch (error) {
            console.log('Error al buscar las tarjetas madres:', error);
            throw new Error(`Error al buscar las tarjetas madres: ${error.message}`);
        }
    }

    async addMB(newMB) {
        try {
            return await mbModel.create(newMB);
        } catch (error) {
            console.log('Error al agregar la tarjeta madre:', error);
            throw new Error(`Error al agregar la tarjeta madre: ${error.message}`);
        }
    }

    async updateMB(newMB) {
        try {
            const updatedMB = await mbModel.findOneAndUpdate(
                { _id: newMB._id },
                { $set: newMB },
                { new: true }
            );
            if (!updatedMB) {
                throw new Error('No se ha encontrado la tarjeta madre');
            }

            return updatedMB;
        } catch (error) {
            console.log('Error al actualizar la tarjeta madre:', error);
            throw new Error(`Error al actualizar la tarjeta madre: ${error.message}`);
        }
    }

    async deleteMB(idMB) {
        try {
            const deletedMB = await mbModel.findOneAndDelete({ _id: idMB });
            if (!updatedMB) {
                throw new Error('No se ha encontrado la tarjeta madre');
            }

            return updatedMB;
        } catch (error) {
            console.log('Error al eliminar la tarjeta madre:', error);
            throw new Error(`Error al eliminar la tarjeta madre: ${error.message}`);
        }
    }
}

module.exports = new MBService();