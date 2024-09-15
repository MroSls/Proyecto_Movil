const gpuModel = require('../models/gpu.model');

class GPUService {
    async getGPU() {
        try {
            return await gpuModel.find().lean();
        } catch (error) {
            console.log('Error al buscar las graficas:', error);
            throw new Error(`Error al buscar las graficas: ${error.message} `);
        }
    }

    async addGPU(newGPU) {
        try {
            return await gpuModel.create(newGPU);
        } catch (error) {
            console.log('Error al agregar la grafica:', error);
            throw new Error(`Error al agregar la grafica: ${error.message} `);
        }
    }

    async updateGPU(newGPU) {
        try {
            const updatedGPU = await gpuModel.findOneAndUpdate(
                { _id: newGPU._id },
                { $set: newGPU },
                { new: true }
            );
            if (!updatedGPU) {
                throw new Error('No se ha encontrado la grafica');
            }

            return updatedGPU;
        } catch (error) {
            console.log('Error al actualizar la grafica:', error);
            throw new Error(`Error al actualizar la grafica: ${error.message} `);
        }
    }

    async deleteGPU(idGPU) {
        try {
            const deletedGPU = gpuModel.findOneAndDelete({ _id: idGPU });
            if (!deletedGPU) {
                throw new Error('No se ha encontrado la grafica');
            }

            return deletedGPU;
        } catch (error) {
            console.log('Error al eliminar la grafica:', error);
            throw new Error(`Error al eliminar la grafica: ${error.message} `);
        }
    }
}

module.exports = new GPUService();