const PSUService = require('../services/psu.service');

const getPSU = async (req, res) => {
    try {
        const psus = await PSUService.getPSU();
        res.json({ psus });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addPSU = async (req, res) => {
    try {
        const newPSU = await PSUService.addPSU(req.body);
        res.status(201).json({ newPSU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updatePSU = async (req, res) => {
    try {
        const updatedPSU = await PSUService.updatePSU(req.body);
        if (!updatedPSU) {
            res.status(404).json({ message: 'No se ha encontrado la fuente de poder' });
        }

        res.status(200).json({ updatedPSU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deletePSU = async (req, res) => {
    try {
        const deletedPSU = await PSUService.deletePSU(req.params.id);
        if (!deletedPSU) {
            res.status(404).json({ message: 'No se ha encontrado la fuente de poder' });
        }

        res.status(200).json({ deletedPSU });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getPSU, addPSU, updatePSU, deletePSU };