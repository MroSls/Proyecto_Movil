const assembledPCService = require('../services/assembledPC.service');

const getAssembledPC = async (req, res) => {
    try {
        const assembledPCs = await assembledPCService.getAssembledPC();
        res.json({ assembledPCs });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addAssembledPC = async (req, res) => {
    try {
        const newAssembledPC = await assembledPCService.addAssembledPC(req.body);
        res.status(201).json({ newAssembledPC });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateAssembledPC = async (req, res) => {
    try {
        const updatedAssembledPC = await assembledPCService.updateAssembledPC(req.body);
        if (!updatedAssembledPC) {
            return res.status(404).json({ message: 'No se ha encontrado la PC armada' })
        }

        res.status(200).json({ updatedAssembledPC });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deletedAssembledPC = async (req, res) => {
    try {
        const deletedAssembledPC = await assembledPCService.deleteAssembledPC(req.params.id);
        if (!deletedAssembledPC) {
            return res.status(404).json({ message: 'No se ha encontrado la PC armada' })
        }

        res.status(200).json({ deletedAssembledPC })
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getAssembledPC, addAssembledPC, updateAssembledPC, deletedAssembledPC };