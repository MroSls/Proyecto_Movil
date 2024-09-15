const GPUService = require('../services/gpu.service');

const getGPU = async (req, res) => {
    try {
        const gpus = await GPUService.getGPU();
        res.json({ gpus });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addGPU = async (req, res) => {
    try {
        const newGPU = await GPUService.addGPU(req.body);
        res.status(201).json({ newGPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateGPU = async (req, res) => {
    try {
        const updatedGPU = await GPUService.updateGPU(req.body);
        if (!updatedGPU) {
            res.status(404).json({ message: 'No se ah encontrado la grafica' });
        }

        res.json({ updatedGPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deleteGPU = async (req, res) => {
    try {
        const deltedGPU = await GPUService.getGPU(req.params.id);
        if (!deltedGPU) {
            res.status(404).json({ message: 'No se ah encontrado la grafica' });
        }
        
        res.json({ deltedGPU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getGPU, addGPU, updateGPU, deleteGPU };