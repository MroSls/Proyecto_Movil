const psuModel = require('../models/psu.model');

class PSUService {
    async getPSU() {
        try {
            return await psuModel.find().lean();
        } catch (error) {
            console.log('Error al buscar las fuentes de poder:', error);
            throw new Error(`Error al buscar las funetes de poder: ${error.message}`);
        }
    }

    async addPSU(newPSU) {
        try {
            return await psuModel.create(newPSU);
        } catch (error) {
            console.log('Error al agregar la fuente de poder:', error);
            throw new Error(`Error al agregar la fuente de poder: ${error.message}`);
        }
    }

    async updatePSU(newPSU) {
        try {
            const updatedPSU = await psuModel.findOneAndUpdate(
                { _id: newPSU._id },
                { $set: newPSU },
                { new: true }
            );
            if (!updatedPSU) {
                throw new Error('No se ha encontrado la fuente de poder');
            }

            return updatedPSU;
        } catch (error) {
            console.log('Error al actualizar la fuente de poder:', error);
            throw new Error(`Error al actualizar la fuente de poder: ${error.message}`);
        }
    }

    async deletePSU(idPSU) {
        try {
            const deletedPSU = await psuModel.findOneAndDelete({ _id: idPSU });
            if (!deletedPSU) {
                throw new Error('No se ha encontrado la fuente de poder');
            }

            return deletedPSU;
        } catch (error) {
            console.log('Error al eliminar la fuente de poder:', error);
            throw new Error(`Error al eliminar la fuente de poder: ${error.message}`);
        }
    }
}

module.exports = new PSUService();