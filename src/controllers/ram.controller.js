const RAMService = require('../services/ram.service');

const getRAM = async (req, res) => {
    try {
        const rams = await RAMService.getRAM();
        res.json({ rams });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addRAM = async (req, res) => {
    try {
        const newRAM = await RAMService.addRAM(req.body);
        res.status(201).json({ newRAM });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateRAM = async (req, res) => {
    try {
        const updatedRAM = await RAMService.updateRAM(req.body);
        if (!updatedRAM) {
            res.status(404).json({ message: 'No se ha encontrado la memoria ram' });
        }

        res.status(200).json({ updatedRAM });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deleteRAM = async (req, res) => {
    try {
        const deletedRAM = await RAMService.deleteRAM(req.params.id);
        if (!deletedRAM) {
            res.status(404).json({ message: 'No se ha encontrado la memoria ram' });
        }

        res.status(200).json({ deletedRAM });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getRAM, addRAM, updateRAM, deleteRAM };