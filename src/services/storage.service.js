const storageModel = require('../models/storage.model');

class StorageService {
    async getStorage() {
        try {
            return await storageModel.find().lean();
        } catch (error) {
            console.log('Error al buscar las memorias de almacenamiento:', error);
            throw new Error(`Error al buscar las memorias de almacenamiento: ${error.message}`);
        }
    }

    async addStorage(newStorage) {
        try {
            return await storageModel.create(newStorage);
        } catch (error) {
            console.log('Error al agregar la memoria de almacenamiento:', error);
            throw new Error(`Error al agregar la memoria de almacenamiento: ${error.message}`);
        }
    }

    async updateStorage(newStorage) {
        try {
            const updatedStorage = await storageModel.findOneAndUpdate(
                { _id: newStorage._id },
                { $set: newStorage },
                { new: true }
            );
            if (!updatedStorage) {
                throw new Error('No se ha encontrado la memoria de almacenamiento');
            }

            return updatedStorage;
        } catch (error) {
            console.log('Error al buscar las memorias de almacenamiento:', error);
            throw new Error(`Error al buscar las memorias de almacenamiento: ${error.message}`);
        }
    }

    async deleteStorage(idStorage) {
        try {
            const deletedStorage = await storageModel.findOneAndDelete({ _id: idStorage });
            if (!deletedStorage) {
                throw new Error('No se ha encontrado la memoria de almacenamiento');
            }

            return deletedStorage;
        } catch (error) {
            console.log('Error al buscar las memorias de almacenamiento:', error);
            throw new Error(`Error al buscar las memorias de almacenamiento: ${error.message}`);
        }
    }
}

module.exports = new StorageService();