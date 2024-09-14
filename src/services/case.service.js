const caseModel = require('../models/case.model');

class CaseService {
    async getCase() {
        try {
            return await caseModel.find().lean();
        } catch (error) {
            console.log('Error al buscar los gabinetes:', error);
            throw new Error(`Error al buscar los gabinetes: ${error.message}`);
        }
    }

    async addCase(newCase) {
        try {
            return await caseModel.create(newCase);
        } catch (error) {
            console.log('Error al agregar un nuevo gabinete:', error);
            throw new Error(`Error al agregar un nuevo gabinete: ${error.message}`);
        }
    }

    async updateCase(newCase) {
        try {
            const updatedCase = await caseModel.findOneAndUpdate(
                { _id: newCase._id },
                { $set: newCase },
                { new: true }
            );
            if (!updatedCase) {
                throw new Error(`No se ha encontrado el gabinete`);
            }

            return updatedCase;
        } catch (error) {
            console.log('Error al actualizar el gabinete:', error);
            throw new Error(`Error al actualizar el gabinete: ${error.message}`);
        }
    }

    async deleteCase(idCase) {
        try {
            const deletedCase = await caseModel.findByIdAndDelete({ _id: idCase });
            if (!deletedCase) {
                throw new Error(`No se ha encontrado el gabinete`);
            }

            return deletedCase;
        } catch (error) {
            console.log('Error al eliminar el gabinete:', error);
            throw new Error(`Error al eliminar el gabinete: ${error.message}`);
        }
    }
}

module.exports = new CaseService();