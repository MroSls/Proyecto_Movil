const CPUService = require('../services/cpu.service');

const getCPU = async (req, res) => {
    try {
        const cpus = await CPUService.getCPU();
        res.json({ cpus });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addCPU = async (req, res) => {
    try {
        const newCPU = await CPUService.addCPU(req.body);
        res.status(201).json({ newCPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateCPU = async (req, res) => {
    try {
        const updatedCPU = await CPUService.updateCPU(req.body);
        if (!updatedCPU) {
            res.status(404).json({ message: 'No se ha encontrado el procesador'});
        }

        res.status(200).json({ updatedCPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deleteCPU = async (req, res) => {
    try {
        const deletedCPU = await CPUService.updateCPU(req.params.id);
        if (!deletedCPU) {
            res.status(404).json({ message: 'No se ha encontrado el procesador'});
        }

        res.status(200).json({ deletedCPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getCPU, addCPU, updateCPU, deleteCPU };