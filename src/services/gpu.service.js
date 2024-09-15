const gpuModel = require('../models/gpu.model');

class GPUService {
    async getGPU() {
        try {
            return await gpuModel.find().lean();
        } catch (error) {
            console.log('Error al obtener las graficas:', error);
            throw new Error(`Error al obtener las graficas: ${error.message} `);
        }
    }

    async addGPU(newGPU) {
        try {
            return await gpuModel.create(newGPU);
        } catch (error) {
            console.log('Error al obtener las graficas:', error);
            throw new Error(`Error al obtener las graficas: ${error.message} `);
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
                throw new Error('No se ah encontrado la grafica');
            }

            return updatedGPU;
        } catch (error) {
            console.log('Error al obtener las graficas:', error);
            throw new Error(`Error al obtener las graficas: ${error.message} `);
        }
    }

    async deleteGPU(idGPU) {
        try {
            const deletedGPU = gpuModel.findOneAndDelete({ _id: idGPU });
            if (!deletedGPU) {
                throw new Error('No se ah encontrado la grafica');
            }

            return deletedGPU;
        } catch (error) {
            console.log('Error al obtener las graficas:', error);
            throw new Error(`Error al obtener las graficas: ${error.message} `);
        }
    }
}

module.exports = new GPUService();