const MBService = require('../services/motherboard.service');

const getMB = async (req, res) => {
    try {
        const mbs = await MBService.getMB();
        res.json({ mbs });
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}

const addMB = async (req, res) => {
    try {
        const newMB = await MBService.addMB(req.body);
        res.status(201).json({ newMB });
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}

const updateMB = async (req, res) => {
    try {
        const updatedMB = await MBService.updateMB(req.body);
        if (!updatedMB) {
            res.status(404).json({ message: 'No se ha encontrado la tarjeta madre' });
        }

        res.status(200).json({ updatedMB });
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}

const deleteMB = async (req, res) => {
    try {
        const deletedMB = await MBService.deleteMB(req.params.id);
        if (!deletedMB) {
            res.status(404).json({ message: 'No se ha encontrado la tarjeta madre' });
        }

        res.status(200).json({ deletedMB });
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}

module.exports = { getMB, addMB, updateMB, deleteMB };