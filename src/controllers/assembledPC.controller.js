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

module.exports = { getAssembledPC, addAssembledPC };