const coolerModel = require('../models/cooler.model');

class CoolerService {
    async getCooler() {
        try {
            return await coolerModel.find().lean();
        } catch (error) {
            console.log('Error al buscar los enfriamientos:', error);
            throw new Error(`Error al buscar los enfriamientos: ${error.message}`);
        }
    }

    async addCooler(newCooler) {
        try {
            return await coolerModel.create(newCooler);
        } catch (error) {
            console.log('Error al agregar un nuevo enfriamiento:', error);
            throw new Error(`Error al agregar un nuevo enfriamiento: ${error.message}`);
        }
    }

    async updateCooler(newCooler) {
        try {
            const updatedCooler = coolerModel.findOneAndUpdate(
                { _id: newCooler._id },
                { $set: newCooler },
                { new: true }
            );
            if (!updatedCooler) {
                throw new Error(`No se ha encontrado el enfriamiento`);
            }

            return updatedCooler;
        } catch (error) {
            console.log('Error al actualizar el enfriamiento:', error.message);
            throw new Error(`Error al actualizar el enfriamiento: ${error.message}`);
        }
    }

    async deleteCooler(idCooler) {
        try {
            const deletedCooler = coolerModel.findOneAndDelete({ _id: idCooler });
            if (!deletedCooler) {
                throw new Error(`No se ha encontrado el enfriamiento`);
            }

        } catch (error) {
            console.log('Error al eliminar el enfriamiento:', error.message);
            throw new Error(`Error al eliminar el enfriamiento: ${error.message}`);
        }
    }
}

module.exports = new CoolerService();