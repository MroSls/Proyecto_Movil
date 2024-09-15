const ramModel = require('../models/ram.model');

class RAMService {
    async getRAM() {
        try {
            return await ramModel.find().lean();
        } catch (error) {
            console.log('Error al buscar las memorias ram:', error);
            throw new Error(`Error al buscar las memorias ram: ${error.message}`);
        }
    }

    async addRAM(newRAM) {
        try {
            return await ramModel.create(newRAM);
        } catch (error) {
            console.log('Error al agregar la memoria ram:', error);
            throw new Error(`Error al agregar la memoria ram: ${error.message}`);
        }
    }

    async updateRAM(newRAM) {
        try {
            const updatedRAM = await ramModel.findOneAndUpdate(
                { _id: newRAM._id },
                { $set: newRAM },
                { new: true }
            );
            if (!updatedRAM) {
                throw new Error('No se ha encontrado la memoria ram');
            }

            return updatedRAM;
        } catch (error) {
            console.log('Error al actualizar la memoria ram:', error);
            throw new Error(`Error al actualizar la memoria ram: ${error.message}`);
        }
    }

    async deleteRAM(idRAM) {
        try {
            const deletedRAM = await ramModel.findOneAndDelete({ _id: idRAM });
            if (!deletedRAM) {
                throw new Error('No se ha encontrado la memoria ram');
            }

            return deletedRAM;
        } catch (error) {
            console.log('Error al eliminar la memoria ram:', error);
            throw new Error(`Error al eliminar la memoria ram: ${error.message}`);
        }
    }
}

module.exports = new RAMService();