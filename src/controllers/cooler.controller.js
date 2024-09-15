const CoolerService = require('../services/cooler.service');

const getCooler = async (req, res) => {
    try {
        const coolers = await CoolerService.getCooler();
        res.json({ coolers });
    } catch (error) {
        res.json.status(500).json({ error: error.message });
    }
}

const addCooler = async (req, res) => {
    try {
        const newCooler = await CoolerService.addCooler(req.body);
        res.status(201).json({ newCooler });
    } catch (error) {
        res.json.status(500).json({ error: error.message });
    }
}

const updateCooler = async (req, res) => {
    try {
        const updatedCooler = await CoolerService.updateCooler(req.body);
        if (!updatedCooler) {
            res.status(404).json({ message: 'No se ha encontrado el enfriamiento' });
        }

        res.status(200).json({ updatedCooler });
    } catch (error) {
        res.json.status(500).json({ error: error.message });
    }
}

const deleteCooler = async (req, res) => {
    try {
        const deletedCooler = await CoolerService.deleteCooler(req.params.id);
        if (!deletedCooler) {
            res.status(404).json({ message: 'No se ha encontrado el enfriamiento' });
        }

        res.status(200).json({ deletedCooler });
    } catch (error) {
        res.json.status(500).json({ error: error.message });
    }
}

module.exports = { getCooler, addCooler, updateCooler, deleteCooler };