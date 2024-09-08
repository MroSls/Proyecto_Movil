const assembledPCService = require('../services/assembledPC.service');

const getAssembledPC = async (req, res) => {
    try {
        const assembledPCs = await assembledPCService.getAssembledPC();
        res.json({ assembledPCs });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getAssembledPC };