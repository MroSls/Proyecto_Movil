const cpuModel = require('../models/cpu.model');

class CPUModel {
    async getCPU() {
        try {
            return await cpuModel.find().lean();
        } catch (error) {
            console.log('Error al obtener los procesadores:', error);
            throw new Error(`Error al obtener los procesadores: ${error.message}`)
        }
    }

    async addCPU(newCPU) {
        try {
            return await cpuModel.create(newCPU);
        } catch (error) {
            console.log('Error al obtener los procesadores:', error);
            throw new Error(`Error al obtener los procesadores: ${error.message}`)
        }
    }

    async updateCPU(newCPU) {
        try {
            const updatedCPU = await cpuModel.findOneAndUpdate(
                { _id: newCPU._id },
                { $set: newCPU },
                { new: true }
            );
            if (!updatedCPU) {
                throw new Error(`No se ha encontrado el procesador`)
            }

            return updatedCPU;
        } catch (error) {
            console.log('Error al obtener los procesadores:', error);
            throw new Error(`Error al obtener los procesadores: ${error.message}`)
        }
    }

    async deleteCPU(idCPU) {
        try {
            const deletedCPU = await cpuModel.findOneAndDelete({ _id: idCPU });
            if (!deletedCPU) {
                throw new Error(`No se ha encontrado el procesador`)
            }

            return deletedCPU;
        } catch (error) {
            console.log('Error al obtener los procesadores:', error);
            throw new Error(`Error al obtener los procesadores: ${error.message}`)
        }
    }
}

module.exports = new CPUModel();